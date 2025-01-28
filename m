Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93570C0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 15:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Irg28LANte9kYSaGjsXJzVVqB7ftUyzify/BF0VOQWg=; b=WkuJSL4i4pAJ+O
	W8MbNMx3Usy9d+fyTjUV6WK1h0tsMupjo07BINHe/6O9+KJGJotVDtPVfxRQcvRjPZkH9Un7BsHiQ
	VfxwK01BGW3Cbp7bPbrHQXB+UR30SkAB3R2e6B7HSZCypF7tPrUN0pH6TVZovh+PyDtb+FM04j4cY
	coC08VZvOscNz5e71CxOiWtdM4M2zcvigwOBUFo6NAQ6wIOJ0/wMIEr2nx0/x3sn7nE8Ourn7JyeW
	za+mLjnA2qPPseDuMzCRnTtzN59fArfj31B8QZ8M9/9SEgBSzl85eiJf3mUJSQ7oHbipG1ZZIESFA
	7eqGZCCZBPp73lOFFiUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnlf-00000005BJC-0Bx0;
	Tue, 28 Jan 2025 15:44:47 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnkJ-00000005Az1-2CqH
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 15:43:26 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e5447fae695so10101569276.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738079001; x=1738683801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=S3XKveMjKzfH4sM7l+XcDfSpOxOCeWxER5OxmK97tYGgefExIMXdeuU9fDTRcDrAOX
         oUzzvm75N/hHXZCCRyae0SDsuFtnZQOhy3njpv1m2bOmW8FvGJCwZf+IVDT4R6+y9PHD
         02/PrEkU0SoBv7VGOI7YFix6KZ1KGztwBbjlAGMYPMQdIwyydXU7oMq8VuD5IlLKVAMR
         bLZ5XDbvVg3BKw9AwbVShFEDjIZnNUnK2nGtV3+9h8E0r1R+8vRPX7Nx83YIWCHsje7O
         TCTOYTXBhQGHiMH0OLq7Ve1vIWjQmleYy4heoM87IbOq+SsITtDlRcLiTm8n9W2tv0qO
         M6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079001; x=1738683801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=AwygrlKpa3hFJ7HcBI63uzEd4LGRE+/SiI8AHuLVUPPlMdncKJ7jWXMRc7XQLHbFm3
         GRGzr2Gph5De5GJsOo1pmsrIXHUjaUTF8dIA+p/btCwrS+mY9+0xJe8rZq7PDK/SAH0T
         HbzxIyfHZBbZoeqqr4xg+dlSRdXfycpJj/Fv/XMplp4Pp1s280eiWBzo2dUpu1g3DbMR
         GldSi8g+vM28HRwlh2VcD27xV7x5feLPGPXk8PbdbHVuXvHVNs7UGWCbI5pogGLmVGyf
         sObRaqwB4+6kdru50O5C9Qpx91YaJFprxJ8+kgj+WpuyXcneMlkw7TziHA8bDuXwxy5Y
         t8uw==
X-Forwarded-Encrypted: i=1; AJvYcCUE2ycJTuwk0leHHlZuYt1VtfJZ7mTcAkcmxJJuyL+6VhQ4gGywP2Ugw+uOr4WwRKl9O8qkZxbvrbchLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlI0OpauAiBSKVDzkpFXoO0nlmerSyCGoZPDSQMkfdrBZAifo4
	W0pUNsA1yejyHcRXeMqkunkdvvG/a4SaSw7u6dfwUPyajAQKmcr7NYv9sztjXOIPyGsL1rbgn73
	KNrW4DS33HL09kxX+cbT4GkYE41br4GzBOXFl
X-Gm-Gg: ASbGncsoa7mc+JVA2gQMxLRP3mi8AHl1r+VMkUcEzmQrYHmTfGTjuHY7lgVYiHCaG4A
	0CIKRkAyuiPpTnVxFw5k50gBsu9c5YnIxE7l/4mM1L9YSjIuUVmRIMJC/z6eihgRD24le+Ho=
X-Google-Smtp-Source: AGHT+IGuLqrmdoXiE8apV7tzhOJZ5Xm1OF/NxWm8Kjkh7RMoG05FR1MdO9WMx2ebniwyt0o5rEC0Jv+xP432BtVJDY0=
X-Received: by 2002:a05:690c:4d02:b0:6ef:6646:b50a with SMTP id
 00721157ae682-6f6eb6b2881mr361409457b3.20.1738079001445; Tue, 28 Jan 2025
 07:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org> <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
In-Reply-To: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 10:43:10 -0500
X-Gm-Features: AWEUYZkHRaUuCTQsu1U9C5jhigmIE9c2_8OmkE_i2Qv7ILXtAaTfDLC5EcLBZNk
Message-ID: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Corey Minyard <cminyard@mvista.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074323_881663_FC051F0E 
X-CRM114-Status: GOOD (  18.37  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgNjoyMuKAr0FNIEpvZWwgR3JhbmFkb3MgPGpvZWwuZ3Jh
bmFkb3NAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMDM6NDI6
MzlQTSArMDAwMCwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyNywgMjAy
NSBhdCAwNDo1NTo1OFBNICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+ID4gWW91IGNvdWxk
IGhhdmUgc3RhdGljIGNvbnN0IHdpdGhpbiBmdW5jdGlvbnMgdG9vLiBZb3UgZ2V0IHRoZSByb2Rh
dGEKPiA+ID4gcHJvdGVjdGlvbiBhbmQgZnVuY3Rpb24gbG9jYWwgc2NvcGUsIGJlc3Qgb2YgYm90
aCB3b3JsZHM/Cj4gPgo+ID4gdGltZXJfYWN0aXZlIGlzIG9uIHRoZSBzdGFjaywgc28gaXQgY2Fu
J3QgYmUgc3RhdGljIGNvbnN0Lgo+ID4KPiA+IERvZXMgdGhpcyByZWFsbHkgbmVlZCB0byBiZSBj
YydkIHRvIHN1Y2ggYSB3aWRlIGRpc3RyaWJ1dGlvbiBsaXN0Pwo+IFRoYXQgaXMgYSB2ZXJ5IGdv
b2QgcXVlc3Rpb24uIEkgcmVtb3ZlZCAxNjAgcGVvcGxlIGZyb20gdGhlIG9yaWdpbmFsCj4gZS1t
YWlsIGFuZCBsZWZ0IHRoZSBvbmVzIHRoYXQgd2hlcmUgcHJldmlvdXNseSBpbnZvbHZlZCB3aXRo
IHRoaXMgcGF0Y2gKPiBhbmQgbGVmdCBhbGwgdGhlIGxpc3RzIGZvciBnb29kIG1lYXN1cmUuIEJ1
dCBpdCBzZWVtcyBJIGNhbiByZWR1Y2UgaXQKPiBldmVuIG1vcmUuCj4KPiBIb3cgYWJvdXQgdGhp
czogRm9yIHRoZXNlIHRyZWV3aWRlIGVmZm9ydHMgSSBqdXN0IGxlYXZlIHRoZSBwZW9wbGUgdGhh
dAo+IGFyZS93ZXJlIGludm9sdmVkIGluIHRoZSBzZXJpZXMgYW5kIGFkZCB0d28gbGlzdHM6IGxp
bnV4LWtlcm5lbCBhbmQKPiBsaW51eC1oYXJkZW5pbmcuCj4KPiBVbmxlc3Mgc29tZW9uZSBzY3Jl
YW1zLCBJJ2xsIHRyeSB0aGlzIG91dCBvbiBteSBuZXh0IHRyZWV3aWRlLgoKSSdtIG5vdCBzY3Jl
YW1pbmcgYWJvdXQgaXQgOikgYnV0IGFueXRoaW5nIHRoYXQgdG91Y2hlcyB0aGUgTFNNLApTRUxp
bnV4LCBvciBhdWRpdCBjb2RlIChvciBtYXRjaGVzIHRoZSByZWdleCBpbiBNQUlOVEFJTkVSUykg
SSB3b3VsZApwcmVmZXIgdG8gc2VlIG9uIHRoZSBhc3NvY2lhdGVkIG1haWxpbmcgbGlzdC4KCi0t
IApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
