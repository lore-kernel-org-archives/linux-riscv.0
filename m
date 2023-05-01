Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69455C77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pun3fYC/AfYVfMmGN5ohxbeNIShHjF2qpxJsFDV/F00=; b=PKai3OlPwggOoT
	c3GDmJxFxyiY4GdapYB+YxGxBOrqogYA+ehvHwsOHpxcnCGBoxJp63Vzk5C7dPmhWUOMHN8GYioMt
	U/ZYCWrjcam+jYnl7sdILMmT2PLfhHq+xOGwCZr7nbTNt0wOq8rcrLSOoYju1X8ELUu3d/nzv9DQs
	wEa5m+tAH1Dq1gQAy4CuUXY5hMvtuE0naOfuaVteorax+Ql5+vu20f9oVtdKo2gdYYHhzwiD5oA4F
	N/1zo3i7uJSdGySehMw6W5Pp/oaTVzXnfU78NbqvVsOZ6CrX+Poo2wsq0eIYaWnPY/2yeunk5tE2d
	xm9U7+k6uIUZFfD5cFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptind-000Ef2-1z;
	Tue, 02 May 2023 05:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptinb-000Edr-2K
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:From:Cc:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/OQB6iNKkO4+y/9ieUCeGj1Y58XqXg5k4s4FKmjy7sc=; b=TilXT6PWXcCWvlvICbpCRGk8+C
	YqJLLYBfYd4DLUEyWWeOro3MhoHfFUoA0XFMRcPpZGez44TPXTxd3Cq6x2WxXoHGTfkOYrzxBosyy
	xRp0Iy82uq+fa2wqNMxBa/B1SDobAEJJvIhkDs9n9Il7XDSAW/N0NO5En7ElS5eyfcUe60PYqDHhG
	kXYGKFl3A2JTKx0/GS1cSCnwZ4Fva1R3pDqBSIW1Bba0YLoBUNNqknzyxTox17E50DpeixNfwcwNk
	LDxYAr6yL/wy4xfADkGo4y3Nw+tCNLurgzcO0MsxJSmjBJzkPbcV77/m0tc11zO002g7F1IW1L5NM
	3h5ID6Dw==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptcGU-00F2KO-03
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:45:06 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5191796a483so2035896a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682981100; x=1685573100;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OQB6iNKkO4+y/9ieUCeGj1Y58XqXg5k4s4FKmjy7sc=;
        b=4KDaiO6LisTYLT/TMV+oW0SlgxHJuKfLtpmqI92q2ZRpt4enwVBFhEDSKsuv5bhoLS
         fOGzlpM359VrlHKC86rq5jD4shsPMnm2QEFNdXVZ52oacbI3u8Ld+v3eeVfv7mlF/beV
         Io5Zp1RXghjwmd4bCP9KS+Z3NCInXlMqcLIYfz5fBA0OHV0tX4BFL0NB3LxjNmcTx53Q
         YDiu7icXGBhsbgQ299UJ+udPCmd6qNnk4elkz3jpRtF4PUV/WmzRjsULt7PRDRvexNsE
         rjRa87S6ZzSESGtFLtmtx6NEAm+rp/2ixnPeTMKo8RTpYSlJR+ParJtAK9HVDSvvVFC9
         C/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682981100; x=1685573100;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OQB6iNKkO4+y/9ieUCeGj1Y58XqXg5k4s4FKmjy7sc=;
        b=bxknHECQtEAc9xmshi7RBCHy1GXvSzkfBIn+VWcgWyVvouUi6fP91cs2PWCaN8mg65
         1BpOmrddziW/nWpKbkiwA0BveWogOvbrq7prvypQyEdDHGSGfBW0yqBkkxQoElzaRpmW
         ytVLrLDr/9E8ZT1ad0E5cC33cGVXF62gOJLI6D+zNiVyOCaywiosRr1KXttJ0o60dd61
         5dBuU/kkJWedBj4tvl9oUm5yr1ORuZauNARrPE3/i6HB6h2vTHY8QGjbbsuNCGYtd3A2
         8ZouuJNkiTvNRhzcXB4QsQPKi9Bgqj31C+yQTClbyG5RM6W+eUGe4I+YopIaFl0ICoEJ
         RNHw==
X-Gm-Message-State: AC+VfDxfW049Dbp2zrp+gMtwdmiW6vHCScs2a/nZyvA+ZNJXdxlrv2Rs
	XVLJw3OWbUXGKVLltC9kzbWGBQ==
X-Google-Smtp-Source: ACHHUZ7uy00k2USN1lzmV5AsdHPtzc5Q0FuQEmXxK9cV9XA1tn/I1mSKAP4YeiluCRIOkTtjzeEmVw==
X-Received: by 2002:a17:903:22c9:b0:1a8:1867:1f71 with SMTP id y9-20020a17090322c900b001a818671f71mr18923506plg.41.1682981099840;
        Mon, 01 May 2023 15:44:59 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902789700b0019ee045a2b3sm18262780pll.308.2023.05.01.15.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:44:59 -0700 (PDT)
In-Reply-To: <20230427163626.101042-1-ajones@ventanamicro.com>
References: <20230427163626.101042-1-ajones@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: Align SBI probe implementation with spec
Message-Id: <168298107617.32296.1350302899241039554.b4-ty@rivosinc.com>
Date: Mon, 01 May 2023 15:44:36 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: "'Rafael J . Wysocki '" <rafael@kernel.org>,
  'Atish Patra ' <atishp@atishpatra.org>, 'Mark Rutland ' <mark.rutland@arm.com>,
  'Conor Dooley ' <conor.dooley@microchip.com>, 'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>,
  'Will Deacon ' <will@kernel.org>, 'Daniel Lezcano ' <daniel.lezcano@linaro.org>,
  'Paul Walmsley ' <paul.walmsley@sifive.com>, 'Anup Patel ' <anup@brainfault.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_234502_355095_3A572DB9 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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


On Thu, 27 Apr 2023 18:36:26 +0200, Andrew Jones wrote:
> sbi_probe_extension() is specified with "Returns 0 if the given SBI
> extension ID (EID) is not available, or 1 if it is available unless
> defined as any other non-zero value by the implementation."
> Additionally, sbiret.value is a long. Fix the implementation to
> ensure any nonzero long value is considered a success, rather
> than only positive int values.
> 
> [...]

Applied, thanks!

[1/1] RISC-V: Align SBI probe implementation with spec
      https://git.kernel.org/palmer/c/41cad8284d5e

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
