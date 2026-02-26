Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B36EEFD23F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 05:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUKEd2ugT/Awe5KcxiTLnfkskPCKYHuYLoXuHLKBIH4=; b=ZFYNTCFT+K6YMq
	TPMT0HwJAol+gOVFcllyrJgumKj83DjwYuaoE85zCfrPgKpYdEshM/dZ2168w353wFdcWZJuQCEsx
	XCR62NyBdyLvmgoz67UN9RsJEDaxAllDFHDMv9rUDDQuEulhYD4jS4gX5q9gqIs3OtuYFiHQW6ZBv
	Iay1NzQU8HqOlm4OcshqY5+XpKqnjtSfQxprqizFelctwQDl/rC2sZ69zOEB+K5Jm2P/Ix3SBgldC
	3GLxU8tRedKWfk6RAHaU+3rb+Fre5R6F+px7Qz//m5n24nf5ZhkHx4sTLuJWS6QBMXCqjtmv+5XMv
	ByKHa0XYDh1p25PrnvYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvU26-00000005Qo1-0pTA;
	Thu, 26 Feb 2026 05:35:30 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvU23-00000005QnH-1hjJ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 05:35:28 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-673f0b73dd3so420472eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 21:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772084126; cv=none;
        d=google.com; s=arc-20240605;
        b=Q54nbzRWIPt90CYW/67MyrVKtD3ioEvw/v86gtcpOH0MwZayiflg7ZI8Ob4GQzhwVY
         hv+sZK57PN6p4e5Y2CEctMxGORN0s66eDuBEctaqN3Eafg0gLzTfOnyio+UIFsMQJebX
         EfgBfGh5dfPPdJILY4j2d7QUlNX+/BDp4Ac9LRpmrzp1rvjfh09BE0yDvqmqEkIAa615
         ADBXCjk9wSSyteDhQ6rBDCC3bZCmBi705OTmHVKPm8cX8CY9ggwP4TxJZOp0zkEmaCo9
         Z+qUy+MJ/67l1oEoisJKUBzeoqbTp57o3f/b5sBm8RuPva8hfZXS811BNkfkt9ZbfHrg
         +YqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SoIYiDKrTfrZA07IUTdp8mDD1wCdkLhIGurnc5/62XI=;
        fh=/xsU/0Yn3G2oJ+eWtELvzYDi1fhzDyfZBOiqCZ9nJ6Y=;
        b=jKZKt3lIy9b+zM+FnlkmWVwJbhSxyhdnF9sWJUluVoKBjhW1V0DHvTOLOV5AJN9eo2
         HkCLr5/broPCURW8ZcE5Nl8Fl+PJTMFeJca0VZU99Zom0xmdWyYSYVkLzYf5xUO8nHSG
         0eQpIY3iuqfRqcZIplAVmCDFJRgSjG3bh5J1fw7d6D5QhKwIjtjVFxNESMafXC8i2TxT
         y1KpKZQHuoiZJ3iAH1lr36zcc/WHOppxSMwotYCUCU/sRO2HBjQd+oqY/iwEQK8FJE4c
         leBUskSnAkeVbcdSr9W4PQDvyhF2kbVAY6gqyPX1ktZpsYlsXL9xJP8vnE0DfswtKk0k
         BEFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772084126; x=1772688926; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoIYiDKrTfrZA07IUTdp8mDD1wCdkLhIGurnc5/62XI=;
        b=iaqmOok3JpZHMY6ahUgOsu4vhPMDxXu86GSjiaODZcKILvtj3POpsF730ZF5CUq18P
         g/4fB2szuRbxc6dz0sVLxA96Nshdm0ytvGVX2KkrgQNij5ohTWWIugCLZJtdcZiF2flK
         RchHimEqkwbI9a8TwSJbCCynEZOSuVMFaCDryqb0tkymb58w7Pul0DCm2jkNS7i4VYUC
         z92lBcrfS25bHpl1sMMZMXAv/UPYJ+Wxj9UlXltpnf1UReinEGPflG7EPzsn/ecW0n7v
         2eLj1JL3ZbBxxh/DdD4WmGjRV/qc2uf+xNLknYRXYyAd1/dFwyF/ITusAsd4764yRALn
         Aenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772084126; x=1772688926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SoIYiDKrTfrZA07IUTdp8mDD1wCdkLhIGurnc5/62XI=;
        b=QJkZpH3Z3gjtAb4cCCKRvOpxQsQ+9xcUVR1iKw8K48wimnYtGp1wOSXRr+PTLQEuMy
         UnF2Lf0M6T0g743vCaKfSEhftQrGw0S5NDC506r7RkR3WRfBs0l89O+7NwgwWV58nbM7
         DcAyKrDsuoXh7FlzEcCwat2uWbAcUbIBJeqXEP0dQ9SoxSAZv574/GVtiDNmJmHZnOvh
         8NWJLP5vy2SlHU2Po3DwxcK/XildMaa5HEEi98JuOaMnsD85pbJJjtbt4/mY/0BffKxf
         nvJ7t2ser56Uel4CEPsLSe/CNBTrnVXgnfJWS8XcdulhTrsE7JiMSCogNwtxrTW//N+z
         OkRA==
X-Forwarded-Encrypted: i=1; AJvYcCWoA1Hc81AK42vRjC2IimnQ/dj4OYqt2mXxmrBhRHPUG88oPoCokY3ZlXR0LdjEnuhmmtZ70vCGkYRO0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLvymwIZmN1Vr899sn2SXgiTYcDJBFOBeDmqsOhBCnalz9zRw
	4ZzKDep2fmAjjlJ1/RnU30P1B17nEVrLweQZJ6odi5siGihFq4Q3besoz6p5zuh6fT/nW8DeHeE
	55Yzhzgg0l5bxhDxqyUyHnr4wAR+1+wFhqy6Kp0Ypyw==
X-Gm-Gg: ATEYQzwj57P86QPtEUoTedSa6z4Jz10Gs8Z8BMnPI6gFh1jlmnKrjAxk2ytZ5EsyQex
	md2O6I0KOSgihMLdDjGqtrJWRAiN80sqLLHJrNZJaOMMDALDFYJm6N9xYK5okgJHMjS3nrk15WF
	CVClkSer5QaD45/bUzNbTo5VAJSJVvcAK7zQ7hPGqoTbn/c1FUS8ijnWI/NPuysBfzSa0lUqsgz
	XpA8mjUxfNumDhpumYlrnaMxd32gj2Ux8v+Jt1wz14M0glG5WtdG/6/kSwjNB1DTcn4orl48I8r
	+KjJQU5G44vQf4Jk0tiJEAu7AFvWDbCUtk2tkiN6TZelv/rVYEbPmn5+FcYtnGTpgofuJU7L5ij
	MB/wm0gmpQzTTl7zRZQZ7hiLviTQ=
X-Received: by 2002:a05:6820:f09:b0:674:62e7:1918 with SMTP id
 006d021491bc7-679f3cdf513mr578781eaf.11.1772084125910; Wed, 25 Feb 2026
 21:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260223-mouth-plated-50294c7a6ac0@wendy> <CA+Ht8=aoxQp-RcFGWXXsfDyNarCn=zRhUOoG9rUCGeEw83BQvw@mail.gmail.com>
 <20260224-likewise-rimless-151f6a12b092@wendy> <CA+Ht8=Z-iaQ+zys5UOy6iNtdTsdtjq7mARwz=KJA_vbNYcfF6w@mail.gmail.com>
 <20260225-compress-moody-400a1e2f46fb@spud>
In-Reply-To: <20260225-compress-moody-400a1e2f46fb@spud>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 11:05:14 +0530
X-Gm-Features: AaiRm51Ev9Hk-4IYZ3H9yognwgMNz9ugxC5I2XQEEWMYITSOj_IvIMrPSpJkhpY
Message-ID: <CAAhSdy2WHLahqPMTCqoSff6Z3no8sX2j_g858jp4XW5Et4dJXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Conor Dooley <conor@kernel.org>
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_213527_706797_FFE572D7 
X-CRM114-Status: GOOD (  17.38  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMjozMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCAxMDozMzoyN0FNICsw
NTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMjQsIDIwMjYgYXQg
MTozM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBUdWUsIEZlYiAyNCwgMjAyNiBhdCAwOTozMDoyNEFNICswNTMwLCBI
aW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+Cj4gPiA+ID4gT24gTW9u
LCBGZWIgMjMsIDIwMjYgYXQgMzo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1p
Y3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgRmViIDIzLCAy
MDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENoYXVoYW4gd3JvdGU6Cj4KPiA+ID4K
PiA+ID4gRGlkIHlvdSBtaXNzIHRoZSBjb21tZW50IGF0IHRoZSBlbmQgYWJvdXQgdGhlIHJlbWFp
bmluZyBUT0RPcz8KPiA+Cj4gPiBOby4gQXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRl
ciwgdGhlIHB0cmFjZSBzdXBwb3J0IGlzIG5vdAo+ID4gaW1wbGVtZW50ZWQgaGVyZS4gSSBhbSBh
Y3RpdmVseSB3b3JraW5nIG9uIGl0IGFuZCB0aGVzZSBhcmUKPiA+IGltcGxlbWVudGVkIGluIHB0
cmFjZSB3b3JrLgo+ID4gVGhlIHRlc3QgaXMgZG9uZSB1c2luZyB0aGUgcGVyZiBldmVudHMgZGly
ZWN0bHkuIFRoZSBzZWNvbmQgcGF0Y2ggaW4KPiA+IHRoaXMgcGF0Y2ggc2V0IGhhcyB0aGUgdGVz
dCBhcHBsaWNhdGlvbi4KPgo+IFRoZW4gdGhlIHBhdGNoc2V0IHNob3VsZCBzdGlsbCBiZSBtYXJr
ZWQgUkZDLCBzaW5jZSBpdCBpcyBub3QgZmluaXNoZWQuCgpXb3chIGxldCdzIGFsbCBvZiB1cyBw
b3N0IG9ubHkgbGFyZ2Ugc2VyaWVzIChjb3ZlcmluZyBtdWx0aXBsZSBmZWF0dXJlcykKd2hpY2gg
YXJlIGRpZmZpY3VsdCB0byByZXZpZXcgaW5zdGVhZCBvZiBtYWtpbmcgbGlmZSBlYXNpZXIgZm9y
IHJldmlld2Vycwp0aHJvdWdoIGluY3JlbWVudGFsIHNlcmllcyB3aGljaCBtYWtlIGdyYWR1YWwg
cHJvZ3Jlc3Mgb3Zlci10aW1lLgoKRllJLCB0aGUgdjEgb2YgdGhpcyBzZXJpZXMgd2FzIHBvc3Rl
ZCBhcyBSRkMgYWxtb3N0IDIgeWVhcnMgYmFjay4KKFJlZmVyLCBodHRwczovL2x3bi5uZXQvQXJ0
aWNsZXMvOTYzMjM0LykKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
