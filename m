Return-Path: <SRS0=HKfm=WM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7172C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2019 19:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753D32171F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2019 19:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgWbLSaV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VNXcHJj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 753D32171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMpttDeCgRsKnj4L5hU2eq6viqHZqGnVgCdev+g0ON0=; b=hgWbLSaVN1hUV3
	dtcUXzsFu3oJ6wT/8qQTUiS8/+Knuy9EKJqnkG6p2I4lxYGD5rRagQbDE1d4LlYuv7gGXQvz58id/
	OE9BJ+ZpGmIx8O9+vyt7kANYggCiEB/IU97wT6d3xpld5Py46QMfKc1YpjqdnLRJHtXF0y6sDnnsS
	17Gkks6NG+9DkCldRwEYNpCaBfx4Sdf+sPO6exzxp31IasMtHbL/rFf+l/k84AF8zoo6e+kk3Jda8
	GUknpMewx0jZVuIPrXGgpkMVs0gpczhlWJnQYl6AGuqdRdm8PFvesLLDJNYs1hNPK1ycgWpolNCrW
	A1yjwoI6F4A8ucDef/Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyiFP-00039t-Mm; Fri, 16 Aug 2019 19:50:51 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyiFM-00039a-I3
 for linux-riscv@lists.infradead.org; Fri, 16 Aug 2019 19:50:49 +0000
Received: by mail-io1-xd34.google.com with SMTP id j5so8552480ioj.8
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 12:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ONmXDIuNzqxdi+K97+GLTBz35xCP5n9Rpwaa6NR4X5Y=;
 b=VNXcHJj88JMFq9KE744X5PtYUIZR1hoxfNMb+IClS7AMdtDL2fxI1BJh7OOYf/Yt8t
 1dOq+un9FCmneTtcaBN69a6rXMJ3BJ8DmXEPTwAijWMrIvgOmEb5DtdzA4DNmZc+4s8S
 gn8MhTdmYCmOIeAD2IN0tep5IDWASsREUFXKtzA/WT3jS9h4QJ2qixSwyvp6xOPKl5nV
 EPW6K2W8s2D2IqeKBwNrphryDgMZBVNuxSMjANFETc6IRIQ7e6Gs/iswlGsFoDCSaWRW
 DPJ5tKhM4/NKFoX0cFHaHtahMbAqs5CCla9PgtnYJxBLhuA83ulK4yXp944H38TxbY5g
 1SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ONmXDIuNzqxdi+K97+GLTBz35xCP5n9Rpwaa6NR4X5Y=;
 b=nyx7fZaYpUZyRjdLndCHmGGKLK8I/G2zA6UhPaCLux2YAsfWK1K/C9l6P+w8lk/yiQ
 Nexz97rmaEB4D+FHal4Dh+g6wZcwOOUerVBrwS+WB2eDg8pihHzGJciPDx/PR1i+ehkT
 4JJp5x9ZS2dZTgJQbGj8T09+aHupTQ9rubEnUCnQ/Gn3UgohM/R8k3Zs+G7novztM6dt
 UTm4ozAOTJleVXK/psZFbn3VBzKRSKWrdqBSSZfKrneJKQf5AEYnbm7pzRPm3zpKxSWB
 Jom7CBw6rVrnFQzFutAwc4S4waplisomQ5mo9N248WRpMwvF2iH0fg3LQ0TxWc50N3C3
 1fMg==
X-Gm-Message-State: APjAAAVqdvT/FIOguyTRVtp8s4dEZ+tpDIgReZlBOXz9TyaHbaOclP2z
 ltaX1eDgzrhzEfbr+MwvPEWhYQ==
X-Google-Smtp-Source: APXvYqxw5a4Xhc3YqX+G5NkX3dJZLdeC1f5dYjeMdNRatyDh9AdvjMZRqJyAyPcKww3csdyckiDoWQ==
X-Received: by 2002:a05:6638:627:: with SMTP id
 h7mr12815495jar.33.1565985047069; 
 Fri, 16 Aug 2019 12:50:47 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 i4sm4807204iog.31.2019.08.16.12.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 12:50:46 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:50:45 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Carlos Eduardo de Paula <me@carlosedp.com>
Subject: Re: Changing SiFive Unleashed core clock rate on 5.x kernel
In-Reply-To: <CADnnUqeUwjhmFp5moem4Cx-ux1kAmhpdyeerTqZ2cNhyvrT_hw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1908161221010.18249@viisi.sifive.com>
References: <CADnnUqcp_7yN4WK2uXberCV_uwjPSj0PxpiXg6kp71--QGPJaA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1908131417450.29979@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1908131908000.19217@viisi.sifive.com>
 <CADnnUqeUwjhmFp5moem4Cx-ux1kAmhpdyeerTqZ2cNhyvrT_hw@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_125048_628307_A404902B 
X-CRM114-Status: UNSURE (   6.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 16 Aug 2019, Carlos Eduardo de Paula wrote:

> Got it, just to be clear, the sysfs changes only work on this 5.3 tree
> and patches right? Not on my current 5.2-rc7.

Those three patches in the branch that I sent you seem to work about as 
well on v5.2 as they do on v5.3-rc4.

v5.2-rc7 by itself won't do anything in this regard.  Those patches (or 
ones like them) are necessary.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
