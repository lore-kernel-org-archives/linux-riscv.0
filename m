Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EF3EA7940
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7vYzHooVzv5iAIBePd2dcAMg3Uif9t4c95uWj87pT4=; b=zIcb4COs0hjdac
	UVP7aKPOQ72SNASVQP5v4ta7UtDa8EgvDcYartYKAkLeaF4Q9sN8VR2R0TXylWNf/xamV0KaabrWc
	WpEd8KZx291+E1zQHbfEBVV1ZfvuwZ4Ad5wJsds1IPKH1bEcq1TuhmhMqEOxlZzs4u8JHDQRNoc9b
	r9EmeTBVh2syGZyKPoVnZqwoEoXQpokuZko/1/feRE05iZcyDzR3Su2U+SqXi683G7f9ZhdkDqbO+
	VLCOqtVldqOYJH9YbCqNAeFFlysG6+Hmj8RTbkbcULkM0BDylbIcqKNq4O7tVmHcn9/9raipTd2sl
	R2+aluo8xV6t0GktkRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vni1G-00000008x2K-3Wwd;
	Wed, 04 Feb 2026 18:54:30 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vni1E-00000008x1O-18q9
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 18:54:29 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b703e04984so5101eec.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 10:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770231267; cv=none;
        d=google.com; s=arc-20240605;
        b=WiBWRX46LHXy7Kv7Kn3Swh/fgR3deoJuQtDK4sl9fQaAs6OVLIA3VbS9N08vouVSvr
         GxNbyVJE7iFET8DNnYYIRquRzr6b4WzrrF6R6ettu5Cr1Zf2PO3BJX2C1zrsRd2PJ809
         v8rfShb4WnLn+9yQEQzd7fhcs0DuSqPZmWMsJSqy6PbOBmZ09oJkHZsCX7acs/3JNlU2
         Yqy6ThVjsKBUtDCRPwX4U6hZrofB/UeJ+g6MOI6rRuIFeQZp+65MTTCxY12FTSegc/XW
         PPXwDDYHTjyapJ+17rwg7UVb+0bP60mBJ4tVnXcJADTVLow/T2G8COYANrRhZjkMs5zu
         Hebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        fh=hud5VFJT5g5VNi6pO+VMGzaMRs9MtdqQprT8K7vjFW8=;
        b=jltxOVtfTbEtAkoxDcsYe7GeEXJM4uIj8OOUo9G9pqmdozK2aoHveOI3wfiP8I1GeE
         BwQjQ+u8BW0i9pODLCVQ1qulywP07iztT4Vo2b7sACs6CCy2HSQ0s12EQbjLzFBRKuWy
         SZasaM3XImxzwZzocl+XgcCtmN+drGVTDSqZ2kAFoOvd/Cy6ncAFVOGdY5TNA98Sp6P1
         Zke3+OdtQ5p9cNwfoqehHxuB92Jy2oSrROO4mQ/SdeXwhrcJxzbRvFw+pQpHVcKOsPzP
         Und6NAJPEOefZ7olYV/H9qu7qNozo/rCXGWYmKgtNvv31jhorY5uWUcnJ80w8PXQX9YW
         pBXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231267; x=1770836067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=geBxHOoTeuSPk/7eEnCrkCJTgpyzhYanxfptsnzwyV+jN3yWiTyHY15Xp21uQIasKf
         nM6oBbDvkuxC76XAtyHbUJ/yPCf4BnfNtoCdka4uhhgwku5QVNzkKKyzDMGRmfbGzKWr
         nYFa1S5qaHo5R63kW0Qac7wUqN23rfvU+62YPezrHCov8VIizTmefwqwUVpbIR/F9jbd
         N9y99abltvSQRgkTrBgqhbXn/7kTJUYzGt8nJqOYPrEjZJkW+lUVcHv7A+o1OBY0fY/w
         Rdy0kcyJ6X/VRFT6EZo9tVFMQri0z23Y+h0YMxbtmPchScq7ZE0CCbzlSFn4c33TuoPD
         Y1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231267; x=1770836067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1RPD11HPFnCejVcKGso6kkcyi791BttWY+zwBXmHJDg=;
        b=VIYkhTYQulN41doVZn6AE78UaIMNcdqkQ/6VJllbwTsAcjlFG6BvhXWnD984ys1hrn
         M9NeAUjddCTRK+visIZ86+voVejJlNn4+s0qAOEjSuLbe26sHA64aLIGsx9XPZY7wVLi
         pF/o4PHfo47TEjUt0ji9t1qBGIlR/t5Rh2W85S27jHYD8HAZzQmB2FITSGlsLLSYnjwG
         Z74UxVqZ5wszknNNqegHBgpWnJ+teb8OhCIA6uTzJSEbQg/+iEhCinTKL+IJEzQ+7XCA
         2QauXJS/ldwGgKNU5ct8D6wZu/C9aGBXElgXha8wogVYVwsWKorlEIqQMNTJaTwpE8Hs
         zFxw==
X-Forwarded-Encrypted: i=1; AJvYcCUgAoEAz2NlP8mZoCulPvldxGdbJr9A1EkseEu5ZJD3D9dmp0zMzvkPynDx2ksJu152hzmhOLVNkssjAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYDHuOJuhT2yE/9A9425FQdNtHNeWW2Hkh4gLKOHSkmgYxoZic
	Vszx4Wrx9Mv6QPCAeWDri83faqqzdICWjDifV9QKAZUEpEXckR9nsWiuS9UrrFAdg4/suMoLy5J
	XoApeMoK8euEnT5Fjc+cq2OjdpL1ivCI=
X-Gm-Gg: AZuq6aIxR2iYMdScBVAo9l2HJLYzFoWaLfT5FkeEKGAU3LyCzk5YMy/00SaWaaf5pyd
	43C0/xO8JJQF5Lq0tdCRnWmFrunggIosp12nVoWNCzhmOwlC3+P/5vjWQmDjKaqSLcZQIklyg7W
	bT/f54wZmrffrDov+DLS3LHD417AXzv6ORBOu7A6kMh7tWursMEviG3rPQEDs9tRDTYV8aeENIX
	q0Lg7xk5H9yCunS3/ufBqhaX8A76O9mRYewyK0AO//qStlOkmQqLEQlRPJrAkRdWTFK/uocmPXM
	maUErmq7nRuX9iZKpEG4JepP/+agBq54usOmj1067DX4xxcS4/VWLRM+A9oQbJi07zRtNt7eFrx
	VhH4Y/lRWJbtK
X-Received: by 2002:a05:7301:fa07:b0:2b7:f145:a66 with SMTP id
 5a478bee46e88-2b832895203mr863567eec.2.1770231266769; Wed, 04 Feb 2026
 10:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com> <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com> <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
 <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com> <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
In-Reply-To: <DG5OGLH0BHNE.2XSVBQHAAXHGI@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Feb 2026 19:54:14 +0100
X-Gm-Features: AZwV_Qga4SHaJVbqnKL6-k_z0NAbFWIYrZ90umh2b3m2XbOK6FLc8RcS6JCVOMk
Message-ID: <CANiq72nhzix4Dr9_gbaFwZQQq=3cDY=oAYVgG5hDAmMgaYKQJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_105428_310773_869C5E03 
X-CRM114-Status: GOOD (  10.29  )
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

T24gVHVlLCBGZWIgMywgMjAyNiBhdCAxMToyNeKAr1BNIEFsZXhhbmRyZSBDb3VyYm90IDxhY291
cmJvdEBudmlkaWEuY29tPiB3cm90ZToKPgo+IFRodXMgZm9yIGFueXRoaW5nIG5vbi10cml2aWFs
LCBJJ2QgbGlrZSB0byBrZWVwIGEgYC8vIENBTEM6IGAgaGVhZGVyCj4gZGVzY3JpYmluZyB0aGUg
aW50ZW5kZWQgb3BlcmF0aW9uLiBJIGFsc28gbm90aWNlZCB0aGF0IExMTXMgY2hlY2sgdGhhdAo+
IHRoZSBjb2RlIGlzIGluIGFjY29yZGFuY2Ugd2l0aCBjb21tZW50cywgd2hpY2ggcHJvdmlkZXMg
YW4gYWRkaXRpb25hbAo+IGxheWVyIG9mIGNoZWNraW5nLgoKWWVhaCwgaXQgaXMgdGhlIHNhbWUg
cmVhc29uIHdoeSBkb2N1bWVudGF0aW9uIGFzIHdlbGwgYXMgb3RoZXIgdGFnZ2VkCmNvbW1lbnRz
IGxpa2UgYC8vIFNBRkVUWTpgIGNvbW1lbnRzIGVuYWJsZSB0byBjYXRjaCBtaXN0YWtlcyBldmVu
IGlmCnRoZXkgbWF5IGJlIHJlZHVuZGFudCBpbiBhIGNlcnRhaW4gc2Vuc2UuCgpJIHdvdWxkbid0
IG1pbmQgaGF2aW5nIHRob3NlIHRhZ2dlZCBjb21tZW50cyBhZnRlciBhIGNlcnRhaW4KY29tcGxl
eGl0eSAtLSBwZXJoYXBzIGl0IGNvdWxkIGJlIHBvc3NpYmxlIHRvIGRlZmluZSBhIGhldXJpc3Rp
YyBmb3IgYQp0aHJlc2hvbGQgd2hlcmUgc3VjaCBhIGNvbW1lbnQgaXMgcmVxdWlyZWQsIGFuZCBn
ZXQgQ2xpcHB5IHRvIHdhcm4KYWJvdXQgaXQgKHdlIGFyZSB0cnlpbmcgdG8gZ2V0IG90aGVyIHRh
Z2dlZCBjb21tZW50cyBpbXBsZW1lbnRlZCwgc28KaXQgaXMgYSBnb29kIG9wcG9ydHVuaXR5KS4K
CkkgZ3Vlc3MgYSBmYW5jeSBJREUgY291bGQgcGVyaGFwcyByZW5kZXIgdGhlIG1hdGggZXhwcmVz
c2lvbiBvbiBob3ZlciBhcyB3ZWxsLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
