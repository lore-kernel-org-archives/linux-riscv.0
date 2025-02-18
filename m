Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF71C021AD
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDjtjlreBSJg+NLsSjsnfaGLckQMsUTEatwA/1M7FoY=; b=A++SK7QGWHfdNH
	f/urk+kobFn7X54KYjUCF5hL7ES+v+ZcgktazmHjoHaiJw6G74QOghv89pWpH034FB2vzm+Z0lZUo
	CqEGPqYGWpz+iAzPXrWl3ouIT2OLk4xkQSM3XGFR1TmlocP57lSvT/8hJqofJyLcBIlE3BkdRe2sY
	dg3ocW/CBhGIzrrigahu5LVcQ4X3p18YNT+UO+WsctVjNnCpk0RcuMRLWj9mzcFrMqQhAjugAwmbZ
	WsxW654vVfuVxKdu1gwKn7SuAAkCdBGcAMNHWhyr7qQVY42mxQ6SPjntbrZ6L2Bvflq3MHc2LwQU3
	WvoYfAM0wurT1GyeKE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU6g-00000009k12-2UlT;
	Tue, 18 Feb 2025 20:22:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTfA-00000009egT-0gvR
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:53:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so41190905e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739908426; x=1740513226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYMHtedu2RkDcedr/ZB86DaCSOrnLAFrvmqyAZWKjac=;
        b=Z0lg/pQtrasRc7AoU80CvStcs1EnrPxBBeTvdjkFnKEQtEjTOK5Zhg34UxHtYE428k
         D2vZ6xMdZERj9xuaojjTYg5KDzh1emJhHNO5BlUcKedwhdBpVfKy2MPFrnYY9FtCMyi1
         5ZWL8yvig/tOGXzhd5Cpdiaw/1oASNUHhv76BZYpJVqZBHEAGq8ZxHyoqJFOSWnT4nxW
         PrNohDUGSnbk8rttD3aiQtHqeVnBSn5e6LQgEfL19JrAWSY8O0Ai/aD4JnPXtvNa75kC
         duyx/4PEZOlaaVLNDrUiuc8w6PdQYGEY1H2UeiRIf/cyH7ZLPuTna7Ffqdh75I4DSFTo
         ymBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739908426; x=1740513226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYMHtedu2RkDcedr/ZB86DaCSOrnLAFrvmqyAZWKjac=;
        b=H5XK/8hIycbywQMBGUC1B42wofrLCimw6vc0cHWqacdxJtcmtb2hQqui5KbnVg6Pjz
         9feUR7KUDQUWuyox5fn7zTj01L7NDrjPIue71GXE/4QBSKRAghWSrRIxBrNnaCujcgOc
         rM8pjs+hJVjVMe9JPpowOvlh6w40leNEx9SHRf4kSPO9H9YGxkKn8eTIM0TcsIppNmHW
         2RBrWpShKNda78FppOwgyv8OV+EcLyJEcGVnWZbrKRtLmnsL0d8KjAExeIfgunqCVkfX
         OR0RLcm7Vb1luj8iFw/72nrZJVFW0unnZwgsuodNK38sHEY5HvAjv3mPWvI4UMOkrNKR
         ldqA==
X-Forwarded-Encrypted: i=1; AJvYcCW7aTAHiQOX4IiH9IiddqCTQ8lKOCZwp7UD58taBg3IHhO37AG05UOswCTSY4JQ9cfneg6YoqLU0I9GEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRihDra75m0cxgM4npDx4BrGu+ZS0yLJplDVYSKpTlcXOXITtV
	8lmkhTkPWkQxiE5e7FUXYKkfX1cxU5mTINbaZXSNnCzqMGqKWLBSCc6LAg==
X-Gm-Gg: ASbGncvf1XT4xklvQbmBUz9Fu6F6oE8J+I2uYdFg9rr3qvpLmVcs3u6N/7zw4J57jQ6
	7+VMetO24x3aCti+e88s7i87x21dylxWgj9PrD7bvW/fYU0EEYYzevhbmXZ/Qhhc851Gwc9/JLU
	ZArtyXhmjoCypl0sdUHlxTLqbJyz+4MTM/jqAqprSBAw7GzS7JjnaUhjxHejdurKqWQOtO5Kadm
	Y+NvVQy6aPYsIOb9okDlA2GIAe66gi03YBTM3dQcDTOsjaqzsXNei3Rw7bM7JKLgblLfdW64roQ
	nh0/nguwlod/U8Us0EQMPQPx13fb6mDXEhDLivt6cBfKpdBjTaqW6A==
X-Google-Smtp-Source: AGHT+IEVzhGLDFw0m2CxrU8xE0NL3g5D882Hv0CJvkZ5WneGTfQV7aWsK7afVUQ8OMm7xDV09B8LJA==
X-Received: by 2002:a05:600c:3548:b0:439:8e95:795b with SMTP id 5b1f17b1804b1-4398e957b86mr60901585e9.31.1739908425796;
        Tue, 18 Feb 2025 11:53:45 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5f4fsm15885782f8f.78.2025.02.18.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:53:45 -0800 (PST)
Date: Tue, 18 Feb 2025 19:53:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Carlos
 Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <20250218195343.10fa6eb9@pumpkin>
In-Reply-To: <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
	<20250217092445.GA29568@lst.de>
	<a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_115348_219321_2E05E1F3 
X-CRM114-Status: GOOD (  16.10  )
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

T24gTW9uLCAxNyBGZWIgMjAyNSAxMzowNjo0OSArMDEwMApBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgoKPiBIaSBDaHJpc3RvcGgsCj4gCj4gT24gMTcvMDIvMjAyNSAxMDoy
NCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBNb24sIEZlYiAxNywgMjAyNSBhdCAw
MTo1MzowOFBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZTogIAo+ID4+IE5ldyBzbWF0
Y2ggd2FybmluZ3M6Cj4gPj4gZnMveGZzL3hmc19idWYuYzoxNTM0IHhmc19idWZfc3VibWl0X2Jp
bygpIHdhcm46IHVuc2lnbmVkICdfeCcgaXMgbmV2ZXIgbGVzcyB0aGFuIHplcm8uICAKPiA+IExv
b2tzIGxpa2UgdGhpcyBpcyBhbiBpc3N1ZSBpbiB0aGUgcmlzY3YgdmlydF90b19wYWdlIGltcGxl
bWVudGF0aW9uCj4gPiB3aGljaCBhbHNvIHNob3dzIHVwIGluIHZhcmlvdXMgb3RoZXIgcGxhY2Vz
LiAgQW55IGNoYW5jZSB0aGlzIGNvdWxkIGdldAo+ID4gZml4ZWQgaW4gdGhlIHJpc2N2IGNvZGU/
ICAKPiAKPiAKPiBUbyBtZSwgdGhlIG9ubHkgdGVzdCB0aGF0IGNvdWxkIGdpdmUgcmlzZSB0byB0
aGlzIHdhcm5pbmcgaXMgdGhlIGxhc3QgCj4gcGFydCBvZjoKPiAKPiAjZGVmaW5lIGlzX2xpbmVh
cl9tYXBwaW5nKHgpIFwKPiAgwqDCoMKgwqDCoMKgwqAgKCh4KSA+PSBQQUdFX09GRlNFVCAmJiAo
IUlTX0VOQUJMRUQoQ09ORklHXzY0QklUKSB8fCAoeCkgPCBQQUdFX09GRlNFVCArIEtFUk5fVklS
VF9TSVpFKSkKPiAKPiBCdXQgZ2l2ZW4gdGhhdCB0aGUgY29uZmlnIGlzIGEgMzItYml0IGNvbmZp
ZywgaXQgc2hvdWxkIG5vdCBiZSBldmFsdWF0ZWQgCj4gYXQgYWxsLgo+IAo+IENvdWxkIHRoYXQg
YmUgYSBmYWxzZS1wb3NpdGl2ZSBhbmQgdGhlbiBhbiBpc3N1ZSBpbiBzbWF0Y2g/CgpJdCdzIG5v
dCBtYW5hZ2luZyB0byB0cnkgdG8gYnVpbGQgd2hlbjoKI2RlZmluZSBQQUdFX09GRlNFVAkJX0FD
KENPTkZJR19QQUdFX09GRlNFVCwgVUwpCmlzIHplcm8/CgpJIHRoaW5rIHRoYXQgaXMgc3VwcG9z
ZWQgdG8gYmUgKG5lYXIpIHRoZSB1c2VyLWtlcm5lbCBib3VuZGFyeS4KU28gcHJvYmFibHkgMHg4
MDAwMDAwMCBvciAweGMwMDAwMDAwLgoob3IgMHhlMDAwMDAwMCBmb3Igc29tZSBvbGQgc3BhcmMz
MikKCglEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
