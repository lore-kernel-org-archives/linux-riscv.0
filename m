Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD84C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWyvZD+3QPs7gLeLXjNHH67S/4ahYZ5KgMTHK/9qDgM=; b=xPAaSzkbwrz+KL
	FTlO/O2urAHt8qdjG0LfgVyEp2+MnvQmXQ7nlKhj19gP4n3j0RsngUYT8B0OQCsgC9xLv2L2k2Knv
	Qp762GJmSTJRZRaFOzQtsJVxj02X13SY33zXga36U26cMWWF3tfIah+HSnbyPvEr7wvlQwGggJoy8
	sfvDmAR45/2qE47UoD2iXHyzI7NyhGI0Shejw58/rPGdVKr+mn1eimHTqj8dx7zwGZ/RXeefds2hB
	xiY8udeeOjaBdSjOpCnQZvEEvCyIX8afAtPoPOGw1M2+6tMkOul0LxXp1a6CLxYIp0yF3JMRm/uqO
	HoHeqb4nOO49x40ipohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1Mx-00Bame-2W;
	Tue, 12 Dec 2023 11:56:11 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1Ms-00Baib-2r;
	Tue, 12 Dec 2023 11:56:08 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d9db2f1ddfso751852a34.0;
        Tue, 12 Dec 2023 03:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702382163; x=1702986963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brKq0jpbW9aCI7b335s4n8QVLb7NZhibmCFvGg8vEA4=;
        b=lbjoZFQJqa9Gl2ItkHlQ4WaYiKbqNDbU/pnxeCYz+VjuoKZeb0fMZXrh/cetfEc1Hv
         5gy1BGWj9kD+fahYaetwsaaEzDxfw8hbPPGFLKC9LvVH8FhYNaHxkYtfcxNAbrW3e0ts
         UD7fB8ArZtL2V2xGvb6oPsBGuJBUDKA/9VgzqU7qpOsR1GzNDeJKz2+DvMShwRF0sFXB
         vmioazHIO249ysZIFl3CaHlA8yISu1jEtHYzCeqArlwDZDypmunWS2LSfwKJ0UkDg7X9
         Xd4J6PiJgfANWOEXXTBhOwQAjK/uOKNom5wKAaXp9q3AtNMzwcD9voZTtrr+80YGXAN4
         I9pw==
X-Gm-Message-State: AOJu0YwpxgPgmP9RSsCoQZsf7JyMhtzLJPg+8wGpduMCD0FLXXW0cXSm
	4pEouqlX46Uu2CQMauj4N3z7VamCX7evzA9m5cI=
X-Google-Smtp-Source: AGHT+IGPG+nLiZPqfM80+t4n70h/b3qWSZ9agga5aMMrFRBh9BzSnCVBMj2CwFXTYVsSwueHiPheyJ3lOPYfl+W+oC4=
X-Received: by 2002:a05:6820:220d:b0:58d:5302:5b18 with SMTP id
 cj13-20020a056820220d00b0058d53025b18mr12282868oob.1.1702382163333; Tue, 12
 Dec 2023 03:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
 <CAJZ5v0i37gGqt=oGC4BxJ4hT5pxhAdL7dPxGf7w3D8THqwAOwQ@mail.gmail.com> <CAKfTPtDXLDpGChy7UXVsV75NHK1OPGHaGYf5G663HWnau4kAHg@mail.gmail.com>
In-Reply-To: <CAKfTPtDXLDpGChy7UXVsV75NHK1OPGHaGYf5G663HWnau4kAHg@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 12 Dec 2023 12:55:51 +0100
Message-ID: <CAJZ5v0ir=2qcQyCg5CPUG=A_09Tdw-rYOX_NQr7eib_yk5t=nA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] consolidate and cleanup CPU capacity
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, sudeep.holla@arm.com, gregkh@linuxfoundation.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org, beata.michalska@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_035606_923407_D7C9C01D 
X-CRM114-Status: GOOD (  12.85  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgOTozMuKAr0FNIFZpbmNlbnQgR3VpdHRvdAo8dmluY2Vu
dC5ndWl0dG90QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAxMSBEZWMgMjAyMyBhdCAy
MDo1MiwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMTo0OeKAr0FNIFZpbmNlbnQgR3VpdHRvdAo+ID4g
PHZpbmNlbnQuZ3VpdHRvdEBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFsuLl0KPgo+ID4gPgo+ID4g
PiBWaW5jZW50IEd1aXR0b3QgKDcpOgo+ID4gPiAgIHRvcG9sb2d5OiBBZGQgYSBuZXcgYXJjaF9z
Y2FsZV9mcmVxX3JlZmVyZW5jZQo+ID4gPiAgIGNwdWZyZXE6IFVzZSB0aGUgZml4ZWQgYW5kIGNv
aGVyZW50IGZyZXF1ZW5jeSBmb3Igc2NhbGluZyBjYXBhY2l0eQo+ID4gPiAgIGNwdWZyZXEvc2No
ZWR1dGlsOiBVc2UgYSBmaXhlZCByZWZlcmVuY2UgZnJlcXVlbmN5Cj4gPiA+ICAgZW5lcmd5X21v
ZGVsOiBVc2UgYSBmaXhlZCByZWZlcmVuY2UgZnJlcXVlbmN5Cj4gPiA+ICAgY3B1ZnJlcS9jcHBj
OiBNb3ZlIGFuZCByZW5hbWUgY3BwY19jcHVmcmVxX3twZXJmX3RvX2toenxraHpfdG9fcGVyZn0K
PiA+ID4gICBjcHVmcmVxL2NwcGM6IFNldCB0aGUgZnJlcXVlbmN5IHVzZWQgZm9yIGNvbXB1dGlu
ZyB0aGUgY2FwYWNpdHkKPiA+ID4gICBhcm02NC9hbXU6IFVzZSBjYXBhY2l0eV9yZWZfZnJlcSB0
byBzZXQgQU1VIHJhdGlvCj4gPgo+ID4gVGhpcyBzZXJpZXMgdG91Y2hlcyBtdWx0aXBsZSBwbGFj
ZXMsIGJ1dCBtb3N0bHkgc2NoZWR1dGlsLCBjcHVmcmVxIGFuZAo+ID4gdGhlIEVNLCBzbyBwbGVh
c2UgbGV0IG1lIGtub3cgaWYgeW91IHdhbnQgbWUgdG8gcGljayBpdCB1cC4KPgo+IFRoaXMgc2Vy
aWUgaGFzIGJlZW4gcmViYXNlZCBvbiB0b3Agb2YgdGlwL2NoZWQvY29yZSB0byBmaXggYSBjb25m
bGljdAo+IHdpdGggYW5vdGhlciBjaGFuZ2UgYWxyZWFkeSBxdWV1ZWQgaW4ga2VybmVsL3NjaGVk
L2NwdWZyZXFfc2NoZWR1dGlsLmMKCk9LLCBzbyBJJ20gYXNzdW1pbmcgdGhhdCBpdCB3aWxsIGdv
IGluIHRocm91Z2ggdGlwLgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
