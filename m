Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D803C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VRVFF8M3IDDNUKTVD4QvhSt8ShtP95mi8cz/pbUvpA=; b=xKbn6f1MGmhIXS
	909jFlXOEzgt023bMgaWpvtknJvdji6KAhRRyg0Kc4Msqw5PjTIHSeFJ0veAJT/r9swzcuWYapLLE
	Ck1U3uK843EU5REmQ23Syv6FOPLNKZ/xqgLX//bIQPDrESWHtQ+o7xU5yZ1NGeEFWbpr52uIWeZdT
	fUSyZRWo0M6OaAUsybY4u6kDrNFM0p7TuTaOCAqpstAXA3jA2+8i0OBWNKypxR21MSOTDtjx7Ez0T
	GBecwY2no1KB7Pwopuqnfusz/8gUNA0g+MBG8ze+DEUH+gCYSTEJ0C+fIPZXNoPEqIEPs/8GZ4Xef
	OXaTYu0TPFmAPxKP9DJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnH-005wwn-AB; Wed, 25 Jan 2023 03:49:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnC-005wvX-F2
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:49:48 +0000
Received: by mail-pj1-x1036.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so673154pji.5
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 19:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVipx85j0ilBiIhcQ0ctp/6MNIb22epcy1N4/Tah10E=;
        b=BT37aw3MFxshRwYN1YtV6EEJeRtk8gBZPqEQAHDygByKQ3aS1aedDxcykJuKN57AJE
         axZ35FwNd0euHwoa2joK0KuK/SMbIn/9pBA7tRcZW3qEhWLiGAmOo2ixrs+pnGpJFu65
         f4GOXtQrT7ZSXS/55ZgPvNrNPhQxkR1RONZi/0Wv7T7YLCktc7U0SU9885SK+GqirWPc
         T7HPYoScdRHRF1Z4gpIUBE9sR5LK8n0qbA07Aql9Cg/bNFDkWqArXqd4w2mPZt0D6LLF
         wuLgRcnXTlvtH4W45v4Ev6XcrqmF2vpdHSniI1FxOq6kxlWIwlgjqxZqfjwRAKmcwuYI
         QWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVipx85j0ilBiIhcQ0ctp/6MNIb22epcy1N4/Tah10E=;
        b=sCwlRUpXs9AE8aA0NFakLPnktwrCaMj7WU0zpuPNxr+DsCEtPnISYnNYVusoShU/nk
         Ycpi/Ik1bWwopmKgsCxHditrAMQjD2RMXtHJgt/vKyQ1SISv5f8flq43RxOUlUCIER56
         32G9IQSQF0xY7jyRgPDcG2+cXyBHGysOKwb79izQ8K7QeIXblMXYOHTMJIlk9eO+Ren1
         /PutaI/WnmqChN/85cafj6Q4pbjGvzoqrQUTXPDmLwuGyaOdgKAefWtFO9e3WiUANKRE
         gqGst7Aj/af9DKlCdJQloWja4iq6LwsOsOpSZVWegWuSfmkp/qE88hsAfZhxCebirPlA
         zuMg==
X-Gm-Message-State: AO0yUKVGlMB9G+3VU9NTlMClXcn412tt7aXnSPjLwiqKKwW1DyLpa4h4
	Jcqui1jzR8jli8FoMYXv4RuljlJSKT2QxEUr
X-Google-Smtp-Source: AK7set8+E4az9jcqv73BSSJ8V05nR3CsEeRfzOaW7+KnIxp00nZX6xYYzd8nPWozbZcAFj4k1uLZVQ==
X-Received: by 2002:a17:902:d2c6:b0:196:1cc3:74d5 with SMTP id n6-20020a170902d2c600b001961cc374d5mr4260241plc.52.1674618585047;
        Tue, 24 Jan 2023 19:49:45 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902a70c00b00189bf5dc96dsm2408476plq.230.2023.01.24.19.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 19:49:44 -0800 (PST)
In-Reply-To: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
References: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
Subject: Re: [PATCH] RISC-V: Kconfig: Remove trailing whitespace
Message-Id: <167461852794.4353.2529464053851561537.b4-ty@rivosinc.com>
Date: Tue, 24 Jan 2023 19:48:47 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
  Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_194946_517964_D27611C6 
X-CRM114-Status: UNSURE (   5.59  )
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

On Wed, 11 Jan 2023 09:15:33 +0100, Geert Uytterhoeven wrote:
> Remove trailing whitespace that hurts my eyes.
> 
> 

Applied, thanks!

[1/1] RISC-V: Kconfig: Remove trailing whitespace
      https://git.kernel.org/palmer/c/451fb217cdca

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
