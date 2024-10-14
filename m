Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC7CD1813A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heMgvwtYnbQsQeODrhNzKagR+bcm/ppM8qEust72ars=; b=Lx9C2+bR7VHTul
	lFGwHCVmtVJFbECIlrTBqYkMpx1TLyOkELuNGPicdgfPXxmowJzm81JuO4oWLntgBdLrgme95J+kN
	yYK7lVqSjtVnEEEKVFfJRAyQtIGgidS5vHhlNo52zwVGYPtyZDorPYi9e8i5P1/koIGrUGfRreD6Z
	7eF1nN8LLhN7Ud3ZKRuyyHr6Fw0m3Gmk3OV7++KXCYe2wmWUzWDd+TXO9OtOXeT4CVjDpPQkKPn6D
	kQCt24JAB/cj7GWGUqj9OHGqO+mRNk4DrkDb8tFrZ4eW7eH3pIs+hvZaqlcDcI0MOSO0ei2Y5Vo8R
	pDFqpp98eHoFwrwDGLnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Prv-00000006BVX-0Muo;
	Mon, 14 Oct 2024 18:32:35 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Pqj-00000006BJB-3MRY
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 18:31:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2854086a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728930681; x=1729535481; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MyJPIjDdd4bcdgmP54xCCeoGcfgAF5sEjDPcoIG7eQ=;
        b=RrnAyH+GeRwyVY0ywGYbUxcJXPYGU5HLrqR2optIZmrpc6EbbhlCbguta5OXskV8SD
         gLxP7ndlTjcbKpEJrpdL0nxhtQQvI+lSxvNh2QA1PBkskdNQ4XsuWISPX7UdZJlDue23
         eXujK4MHSWMaJAU1Oz8ifU/OTXcuM90+/q/pT84TfRscHF+Q4TCAD9CUiDP/pWFqKj+S
         2jbUPpHVcKF5nEwpu3/G2+5nCO/u2noW6kJWuWlx27h8cRrpgKVP+h6bMP5tziyfouQt
         2IhcO6fscz5GgbHN+VFNrhUkrMp4sorsRu+1KEKSd8H+yJhDCa6omnXm328wRxTSTmaK
         VWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728930681; x=1729535481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MyJPIjDdd4bcdgmP54xCCeoGcfgAF5sEjDPcoIG7eQ=;
        b=b6u27R3s7XdfI6gA/lL31i+aSBISUuNW7BbU9A3iWocEwK1iSSP+4llu5U5o+s97wu
         sjYfMS7VfO2XYg3JSO4Y9/d8eBOLrVrXDhJOhe4RXD279d/01TrhK9BGsxyDqcUcBGim
         PSwS3DXt8nT5dls0kb598fzjKCTGv8SmeVRCzl6kCzS4vtkVJXBtJ+1FjCHZRaBGBkil
         9wxSdBMwErvk2pp0jvU+T2eSCZjdEFb7ro/veH/kkLpO8RPMFmb0lHodxZS2PlZi5sf9
         Oy8ekQvuue4j6fC/d0USMCjU86Sta0QJFYuEXjfUvjFdkcc5jYbVGE+Ipi+GP/p3pJlC
         XdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnCms12az7QdpFe+F008ECKWWSCjZsZS//+tYMefWqpdNRj/Jw/e5FofFpfQKh9Me9WGzY7pHZCVKzxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG0p0ECqDHdR+NgtqWPiXeHiILlfTrpz5eiOPCJ0ptwACe7fv7
	6l6KGeIO4pobRKbGbfTFjn1Olh7qVLNMXqO7e0mbTJAWRoQO09XaW4SUi9oI3Ng=
X-Google-Smtp-Source: AGHT+IFEc80xxdqhyMjTS/P2wRAr0IT5/jeoMI8YNDGJsBDXkjZ1ppm37ofoh2IW/bQMBmQHWGHjVw==
X-Received: by 2002:a05:6a20:e18a:b0:1d8:abf3:58bd with SMTP id adf61e73a8af0-1d8bc85cb97mr18051071637.13.1728930680726;
        Mon, 14 Oct 2024 11:31:20 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e6818a0e2sm2143534b3a.31.2024.10.14.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 11:31:20 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:31:18 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Introduce support for T-head TH1520 Mailbox
Message-ID: <Zw1jdl64f5l8N+Km@x1>
References: <CGME20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee@eucas1p2.samsung.com>
 <20241014123314.1231517-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014123314.1231517-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_113121_879549_BF2C9128 
X-CRM114-Status: GOOD (  15.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 14, 2024 at 02:33:11PM +0200, Michal Wilczynski wrote:
> The T-head TH1520 SoC supports a hardware mailbox that enables two cores
> within the SoC to communicate and coordinate [1]. One example of such
> coordination would be cooperation with the T-Head E902 core, which is
> responsible for power, clock, and resource management. For example, in
> the specific case of the BXM-4-64 GPU, it needs to be powered on by the
> E902 core, and the kernel running on the E910 needs to 'ask' the
> firmware running on the E902 core to enable power to the GPU island.
> Given recent advancements in work on the upstream GPU driver [2], there
> is an emerging need to get this code in the mainline kernel.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> Link: https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/1 [2]
> 
> Thanks, Krzysztof and Rob, for your review! Since this series is gaining
> some interest, I've dropped the RFC prefix with the v3 update.

I've applied this series and booted okay. I see the driver loaded:

 /sys/devices/platform/soc/ffffc38000.mailbox/driver points to
 /sys/bus/platform/drivers/th1520-mbox

How do you test that the communication with the E902 is working
correctly?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
