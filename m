Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C791EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAZ0pI2lzAxlCL0GWLqKxRUvVL/qQMGoPAYCYV9giNU=; b=zAU3jtmWw6QmId
	sGP5yv5T99rWeTzfrfKot0F0CGqLXcJmWyltg6ex402Ptj3iInD3/MU+XRr2HXQD/64l4lQvvL5jt
	uyYnfYmsD7M7W0ABiqiCHF5ohELYRdmdwz1UxOBFKpqH0MrQDYOYCYf4mZNw440fGBv96XJ24PkH7
	c7Qq2BldN8+hd9DPvs2OHl8z9UFIaUGsXrC3czuL+Kr7NAL9/cq24EkyQaJ0fVCxP0Fz+n7WSyqf5
	jCWdouJoWLsVTWNH+qfyE09T+CUNkt9X+LWsz/cdBkS7VBoKVmhLgw4WNP05aePfuY4yxDXBOPDOo
	pWFmRjRfhzMiXyy/vURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEDCt-00Do8K-0O;
	Tue, 27 Jun 2023 18:14:27 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEDCp-00Do7Y-2H
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 18:14:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso4363734e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687889661; x=1690481661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0QHGC18vxO2QHVl3y7SYla7+m+avkHqGb8W6MMkPEM=;
        b=tKmSEzN1MUFr3JgDwykDdV9fxf49FUdmPMJCMp/pE+IqGWeDxE9B2caQO5GppGpcoJ
         iMPDOWikOyl/q7Yb8ZAzj5r3MzMNi8HiDhfDCxIXzOrykSuB9Afm/G5g/vgmIXxaxSnj
         se452nyymxHI2AWS91cvYN3clgF1WZRhn9l4uEI7mIPjXRMccF4omvSmCo8MeZn1oVqz
         OvDtldD183qgXBU8Log9dVDb9iwsOSzBG3KUuA6oPN6smKDFen8WWfIlu/ZethCG2uVU
         VrRZUVljz2LRfZ+5sdKNJ0CP8kHFlCWV7TIc9SetsYG8dVcFVVtXB7BKP7L6oO7nzVJj
         L8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687889661; x=1690481661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0QHGC18vxO2QHVl3y7SYla7+m+avkHqGb8W6MMkPEM=;
        b=Bjo98j6HJlRuV9hO/PSz9c65M82xJ89Xk+i3p3OzGDBm0zQ9Ls4O5tLH4TQyIb3IGj
         Om/z7VP/rRiL0v2TRu0o0TpQZpK7crHQ5XCesUp3cGrWp+4w/qpg30UKB18SIO0k0VzS
         O/TJ2mhaNV0G980R1u+CFpNp3REMQFL8O7JoCRxDotSlQK0tkqeAFuWJcM90Gp5+B23T
         e4F8j7UV2oslXstnIBk+P+RfXjqKbzJeBm+MXJHi+I7kKgg5FHQgsToQ80zO77S2m4o9
         CWuRwbPf5ZREyusfx7gTy+k2XjjsSwM80zr68OqOAWgJ0n8wfyq9CB1+uBJhNXFAKtOI
         rouw==
X-Gm-Message-State: AC+VfDzHzroUx3w89b2BWlyBW1afIruyE0Yet5NJAoRfZsXo2i+iSfZg
	7zPEvaUUDP12wzoh8le/g7FE2xmqFyz1JdEj/y2/rw==
X-Google-Smtp-Source: ACHHUZ4yOkXhNDmqb3f8bSYcYTCluoaVOfNxpRXYi2CuLecvu7rdFhicIm/u539x+9fkWlRMNbVMdC8U8UV1YOusgxQ=
X-Received: by 2002:a05:6512:3d06:b0:4fb:7be5:8f4e with SMTP id
 d6-20020a0565123d0600b004fb7be58f4emr4407689lfv.6.1687889661101; Tue, 27 Jun
 2023 11:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230627143747.1599218-1-sameo@rivosinc.com> <20230627143747.1599218-3-sameo@rivosinc.com>
In-Reply-To: <20230627143747.1599218-3-sameo@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 27 Jun 2023 11:13:45 -0700
Message-ID: <CALs-Hsu1Zktm_yik8q7qArsqH4PiJgUGQyDnLtZs+1aqB+DGWQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: hwprobe: Expose Zbc and the scalar crypto extensions
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux@rivosinc.com, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, "Hongren (Zenithal) Zheng" <i@zenithal.me>, Guo Ren <guoren@kernel.org>, 
	Atish Patra <atishp@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_111423_971109_B86DB3DA 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgNzozOOKAr0FNIFNhbXVlbCBPcnRpeiA8c2FtZW9Acml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFpiYyB3YXMgbWlzc2luZyBmcm9tIGEgcHJldmlvdXMgQml0
LU1hbmlwdWxhdGlvbiBleHRlbnNpb24gaHdwcm9iZQo+IHBhdGNoLgo+Cj4gQWRkIGFsbCBzY2Fs
YXIgY3J5cHRvIGV4dGVuc2lvbnMgYml0cywgYW5kIGRlZmluZSBhIG1hY3JvIGZvciBzZXR0aW5n
Cj4gdGhlIGh3cHJvYmUga2V5L3BhaXIgaW4gYSBtb3JlIHJlYWRhYmxlIHdheS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFNhbXVlbCBPcnRpeiA8c2FtZW9Acml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6
IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
