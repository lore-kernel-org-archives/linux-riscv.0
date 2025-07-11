Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA24BC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vOcfnveIF+s3FOuxCkgh8e3ELMC6ta/Ntj9+yM/7HE=; b=rpOqiKJRwvcSxA
	YarKU8jdzqszteErZV0rZJv0a1NEt6V7Lb4PQlkeqwCsHlcwqiolT7kDLt57b/YDNKSJUGRAGuMii
	hRc8xr2aNKef83jhruCa7uDy0TqBBsEgZuEJQJ9KtaIJ5VWUb6JyH3DSQ1OZKcc092ceBD+rU/NWL
	ruPBLLHu19Bdu42IWKXPXp56mf6fhF0T+S04fk8jDOphyN/J5wAiLjChg5psfyukzwDhPQs0SfRm7
	fFI3QWGH3CrlJ6xK5P+mmheimHiRDqP8MPte+g2yZkm7JADAiJPeFmQ20DJ95o5VSFYNkpWnysQqL
	1O/tL0PUzAIHXeBwfTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9wx-0000000EHzP-0fL7;
	Fri, 11 Jul 2025 09:21:47 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua94z-0000000E7ww-1N6G
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 08:26:03 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31393526d0dso1434378a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752222359; x=1752827159; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A2fAk/hY+VXgln3RIT8cl3wcMIkArGIQeZSyy9BGEA=;
        b=TPUX5tjRepLMsZl6QwfYJoXs+6Yfdes7hEJChnOfQEFYPALLQThCs7NVgDfcqsmCoS
         FDyl3INw9h1G2d5kBb+ey7NDM9BoRdqFDQRhhgLk5NBOBSHtQtIIuPiaBZJmaN3wcsiY
         Q0xeRivQ49A1nPw6dD1Gb33IEwijXgsgAIwq4OFA5Bqvgb7AgrH5j14C0g+O4idEq73H
         0e4Zu+3NZctolOuB/baS6+b1ylctd69ZAwqiY7o425TMYIEPaYdDlk/G6vQ3MMNJ508R
         V8wd2tsTyJXnO0U1+eYtVa8wRiOxRCQBuAIeal2S1gZ7H26o/WrIa39/8iD+QUsqLCB4
         3okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222359; x=1752827159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A2fAk/hY+VXgln3RIT8cl3wcMIkArGIQeZSyy9BGEA=;
        b=bL1PSaodT1wYyvQ32S2r696X+AVvDCVDI6gOJYA58CgbYvOvUAWaQ1gSyMnFj8EO53
         0CI8Sgv0ErE6l4BFBkzrB9DSBNjvIAjRek3zVv2YuaIlGGT76xqMg4OzYij19BTpsuu2
         OhjmcjETUvh5ZYNG1NQivLQbZu7uYiPNcmbCuHEVprAvQ3rsCjin9G50vzR+rOOmMTsV
         mnbMVebGI2EFLdpQz0jYbymMrz6+RtyuCrUvV+ZY30oJQ7JQH5qONS7+LJuakDPeAJMX
         xduUG65AhIYyB3/NHl+ZBSaP+2oUWW+W+pb264lXOMnSr9u/TsXHY/oMtAa2Fhr8hRqA
         5prQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpy7/wOO4s5KGsuy0wYY6Pb73lUTua5WsliVZkbT0JeoUdcAHv/tJFQClV/0qFsL9gblB+bKXjrdf/7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdzWrZvvo72IYTTBInmgzeaGw0s/27J/SjFlaHaj66MVvgH7Kp
	0Nf8VBU2DZKKXBj2/bTX+Q1EByQvIIGHTxiOWmFFmgaUCTY4/9o/UX0PTzl+oZ3j655HP5sC0lu
	OtvXT5LnBPL4MBEiSsQSxjpVeiL9u6LJCT9bCsOzQsv9nhR3FrHnF//XB95GXPF0=
X-Gm-Gg: ASbGnct2d4OdA+YQ1Q15oXmj2CRSV76PvlVZYbOv6FCNsaluzG7Szjr32JNFaMzXc+4
	KksHQ/S3Ua6Jfj9dSTMbBNAp6qawozqHA4SJcLdqo53/QTtipU0JSInaaviwIuH7+rKUm7NtqwJ
	eLEtX86j0FrFZXr8S7RIyoPKlk4YqsnK7TiV+33i6eGqtiXo8qrTAX5zm9i7S1hvAOmKk+/+fpq
	voQKhhaY8cHqztHlJol
X-Google-Smtp-Source: AGHT+IFCp1pcD9GmdtCsf5iRMPFHSbp9FsiGavSusUMyRrFKZGE3x/NS3PMLeRJnScYqO8frgAwfK8U/bj7U7Muxpzw=
X-Received: by 2002:a17:90a:d88e:b0:312:959:dc4f with SMTP id
 98e67ed59e1d1-31c4cc9d4f4mr3742093a91.5.1752222359484; Fri, 11 Jul 2025
 01:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250710133030.88940-1-luxu.kernel@bytedance.com> <DB908AUW6N76.3SYAGIFGCDJ27@ventanamicro.com>
In-Reply-To: <DB908AUW6N76.3SYAGIFGCDJ27@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 11 Jul 2025 16:25:48 +0800
X-Gm-Features: Ac12FXyVj12e58tShQlG7C9K_6PvavwmURsMwnmPFZyguWbVaWs8xpiRLy86iqI
Message-ID: <CAPYmKFu2Ggu7_SFkrhfKX9rT7Pdas+jSjksGMFAhHf7Wa83Y8g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled
 faults to VS mode
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: cleger@rivosinc.com, anup@brainfault.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012601_723305_17F2286F 
X-CRM114-Status: GOOD (  10.98  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMjoxNuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDctMTBUMjE6MzA6MzArMDg6MDAs
IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPjoKPiA+IERlbGVnYXRlIGZhdWx0cyB3
aGljaCBhcmUgbm90IGhhbmRsZWQgYnkga3ZtIHRvIFZTIG1vZGUgdG8gYXZvaWQKPiA+IHVubmVj
ZXNzYXJ5IHRyYXBzIHRvIEhTIG1vZGUuIFRoZXNlIGZhdWx0cyBpbmNsdWRlIGlsbGVnYWwgaW5z
dHJ1Y3Rpb24KPiA+IGZhdWx0LCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQsIGxvYWQgYWNjZXNz
IGZhdWx0IGFuZCBzdG9yZSBhY2Nlc3MKPiA+IGZhdWx0Lgo+ID4KPiA+IFRoZSBkZWxlZ2F0aW9u
IG9mIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgaXMgcGFydGljdWxhcmx5IGltcG9ydGFudAo+
ID4gdG8gZ3Vlc3QgYXBwbGljYXRpb25zIHRoYXQgdXNlIHZlY3RvciBpbnN0cnVjdGlvbnMgZnJl
cXVlbnRseS4gSW4gc3VjaAo+ID4gY2FzZXMsIGFuIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQg
d2lsbCBiZSByYWlzZWQgd2hlbiBndWVzdCB1c2VyIHRocmVhZAo+ID4gdXNlcyB2ZWN0b3IgaW5z
dHJ1Y3Rpb24gdGhlIGZpcnN0IHRpbWUgYW5kIHRoZW4gZ3Vlc3Qga2VybmVsIHdpbGwgZW5hYmxl
Cj4gPiB1c2VyIHRocmVhZCB0byBleGVjdXRlIGZvbGxvd2luZyB2ZWN0b3IgaW5zdHJ1Y3Rpb25z
Lgo+Cj4gKFRoaXMgb3B0aW1pemF0aW9uIHdpbGwgYmUgZXZlbiBtb3JlIHNpZ25pZmljYW50IHdo
ZW4gbmVzdGluZywgd2hlcmUgaXQKPiAgd291bGQgY3VycmVudGx5IGdvIC0+IEhTMCAtPiBIUzEg
LT4gSFMwIC0+IFZTMSwgaW5zdGVhZCBvZiAtPiBWUzEuKQoKTmljZSBzdXBwbGVtZW50ISBUaGFu
a3MuCgo+Cj4gPiBUaGUgZncgcG11IGV2ZW50IGNvdW50ZXJzIHJlbWFpbiB1bmRlbGV0ZWQgc28g
dGhhdCBndWVzdCBjYW4gc3RpbGwgZ2V0Cj4gPiB0aGVzZSBldmVudHMgdmlhIHNiaSBjYWxsLiBH
dWVzdCB3aWxsIG9ubHkgc2VlIHplcm8gY291bnQgb24gdGhlc2UKPiA+IGV2ZW50cyBhbmQga25v
dyAnZmlybXdhcmUnIGhhcyBkZWxlZ2F0ZWQgdGhlc2UgZmF1bHRzLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4KPiBSZXZp
ZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
