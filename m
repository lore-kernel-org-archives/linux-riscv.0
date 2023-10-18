Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C2CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr/E8AEzkgXp+0r6LQa+cvQ7yQ50BsMsEiIscQcBJP8=; b=roGm7L7UEo06zL
	cjr9oyNM9rLJs7adyTuIJpqgHX5QWzaKQvsL0eH7EnyFopOtar4pDJ3gzVCjkeFbx4bAm/VCIMgee
	VvM6csOjWCFejmdrsJ5wXK9jIXryYMm942WySH5x50RyuOWduUT+Z1ej/0MBihZJD5F7Bbfv2L7+o
	Iul74+bLAk7XzNlfs0Lgc4TRudKueiV7w8Xw+t9urECZG4UJmDP7Vz6/fl8ZREp86yNeXPPtLeSIw
	yjg7nyd7xrMlISpOFkxJrXTHrdNvOjlm3XTCaVG+L3mVnsheOEj3rdf8jX5S0ztfuz+cd7pdJ4NNq
	TN4V2H3tfagDqr6RF7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAGW-00FIbk-2d;
	Wed, 18 Oct 2023 17:23:28 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAGU-00FIaA-05;
	Wed, 18 Oct 2023 17:23:27 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-582050ce2d8so25816eaf.0;
        Wed, 18 Oct 2023 10:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649804; x=1698254604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2lwiFW7v1x6wJxRpx1c+ObPtw/kHFVlH2vUJpoYMn0=;
        b=K9hnlNjrlECuskx1qyCMqQonBfWJTdH1LsAQ89hRKGegba0om4L8rsfPPodg+OVOrd
         2dTM+j+1w2AI3KA/RgpM0o4ighFsK/K/mGyG3h/44qryxJpfo0YxWBbcAapXOITFzYOR
         w5YnE/xEoefsOiFV4/CUiWJj+n+UKwdyl/3Io62xieA94yqUZTbSPV2FmbGk+UDwHhjM
         ieppR2loQdp9y8kb9Yp+UqGFpDfTQae/5iVaPmv8KZWWgo9jhNcM7CoQZskmdS2he//0
         wNXiDHKUTeM8Yd5SEF/Fp6DUDGJdNDLwmUToXm3levojzA1jmmQXtYguljYYJ0podaiJ
         MTfg==
X-Gm-Message-State: AOJu0YwAS6SY+LHKA86S/n5vrPLM1RuElfo/2bpwXHp5d7Og4xjZpB0T
	DzsEBmCl0Z8SoTXGnYO0BkyKZSsHCMThbPoqB8I=
X-Google-Smtp-Source: AGHT+IGnNjtcabtUMJyCpUS/Q8iadNabFO9ltoFIiy6KhS15PxlDuBSBbxZIY+SzIP5PAczSNxTThF+a9wJpw+QBaOQ=
X-Received: by 2002:a05:6820:180f:b0:581:f17d:5eb5 with SMTP id
 bn15-20020a056820180f00b00581f17d5eb5mr3255065oob.0.1697649804594; Wed, 18
 Oct 2023 10:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org> <20231018162540.667646-3-vincent.guittot@linaro.org>
In-Reply-To: <20231018162540.667646-3-vincent.guittot@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 18 Oct 2023 19:23:13 +0200
Message-ID: <CAJZ5v0iu9AjZWNbMPQbwErYRTz8y0PEGDyh7CU_NwxGj6KXMOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] cpufreq: use the fixed and coherent frequency for
 scaling capacity
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102326_060135_8F68821E 
X-CRM114-Status: GOOD (  18.72  )
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

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNjoyNeKAr1BNIFZpbmNlbnQgR3VpdHRvdAo8dmluY2Vu
dC5ndWl0dG90QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gY3B1aW5mby5tYXhfZnJlcSBjYW4gY2hh
bmdlIGF0IHJ1bnRpbWUgYmVjYXVzZSBvZiBib29zdCBhcyBhbiBleGFtcGxlLiBUaGlzCj4gaW1w
bGllcyB0aGF0IHRoZSB2YWx1ZSBjb3VsZCBiZSBkaWZmZXJlbnQgZnJvbSB0aGUgZnJlcXVlbmN5
IHRoYXQgaGFzIGJlZW4KPiB1c2VkIHRvIGNvbXB1dGUgdGhlIGNhcGFjaXR5IG9mIGEgQ1BVLgo+
Cj4gVGhlIG5ldyBhcmNoX3NjYWxlX2ZyZXFfcmVmKCkgcmV0dXJucyBhIGZpeGVkIGFuZCBjb2hl
cmVudCBmcmVxdWVuY3kKPiB0aGF0IGNhbiBiZSB1c2VkIHRvIGNvbXB1dGUgdGhlIGNhcGFjaXR5
IGZvciBhIGdpdmVuIGZyZXF1ZW5jeS4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgR3VpdHRv
dCA8dmluY2VudC5ndWl0dG90QGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFZpcmVzaCBLdW1hciA8
dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEx1a2FzeiBMdWJhIDxsdWth
c3oubHViYUBhcm0uY29tPgo+IFRlc3RlZC1ieTogTHVrYXN6IEx1YmEgPGx1a2Fzei5sdWJhQGFy
bS5jb20+CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPgoK
PiAtLS0KPiAgZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyB8IDQgKystLQo+ICBpbmNsdWRlL2xp
bnV4L2NwdWZyZXEuaCAgIHwgOSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJl
cS9jcHVmcmVxLmMgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCj4gaW5kZXggNjBlZDg5MDAw
ZTgyLi44YzRmOWMyZjljNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEu
Ywo+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMKPiBAQCAtNDU0LDcgKzQ1NCw3IEBA
IHZvaWQgY3B1ZnJlcV9mcmVxX3RyYW5zaXRpb25fZW5kKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAq
cG9saWN5LAo+Cj4gICAgICAgICBhcmNoX3NldF9mcmVxX3NjYWxlKHBvbGljeS0+cmVsYXRlZF9j
cHVzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb2xpY3ktPmN1ciwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcG9saWN5LT5jcHVpbmZvLm1heF9mcmVxKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYXJjaF9zY2FsZV9mcmVxX3JlZihwb2xpY3ktPmNwdSkpOwo+
Cj4gICAgICAgICBzcGluX2xvY2soJnBvbGljeS0+dHJhbnNpdGlvbl9sb2NrKTsKPiAgICAgICAg
IHBvbGljeS0+dHJhbnNpdGlvbl9vbmdvaW5nID0gZmFsc2U7Cj4gQEAgLTIxNzQsNyArMjE3NCw3
IEBAIHVuc2lnbmVkIGludCBjcHVmcmVxX2RyaXZlcl9mYXN0X3N3aXRjaChzdHJ1Y3QgY3B1ZnJl
cV9wb2xpY3kgKnBvbGljeSwKPgo+ICAgICAgICAgcG9saWN5LT5jdXIgPSBmcmVxOwo+ICAgICAg
ICAgYXJjaF9zZXRfZnJlcV9zY2FsZShwb2xpY3ktPnJlbGF0ZWRfY3B1cywgZnJlcSwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcG9saWN5LT5jcHVpbmZvLm1heF9mcmVxKTsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYXJjaF9zY2FsZV9mcmVxX3JlZihwb2xpY3ktPmNwdSkp
Owo+ICAgICAgICAgY3B1ZnJlcV9zdGF0c19yZWNvcmRfdHJhbnNpdGlvbihwb2xpY3ksIGZyZXEp
Owo+Cj4gICAgICAgICBpZiAodHJhY2VfY3B1X2ZyZXF1ZW5jeV9lbmFibGVkKCkpIHsKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jcHVmcmVxLmggYi9pbmNsdWRlL2xpbnV4L2NwdWZyZXEu
aAo+IGluZGV4IDcxZDE4NmQ2OTMzYS4uYmJjNDgzYjRiNmU1IDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvbGludXgvY3B1ZnJlcS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9jcHVmcmVxLmgKPiBAQCAt
MTIxMSw2ICsxMjExLDE1IEBAIHZvaWQgYXJjaF9zZXRfZnJlcV9zY2FsZShjb25zdCBzdHJ1Y3Qg
Y3B1bWFzayAqY3B1cywKPiAgewo+ICB9Cj4gICNlbmRpZgo+ICsKPiArI2lmbmRlZiBhcmNoX3Nj
YWxlX2ZyZXFfcmVmCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUKPiArdW5zaWduZWQgaW50IGFy
Y2hfc2NhbGVfZnJlcV9yZWYoaW50IGNwdSkKPiArewo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30K
PiArI2VuZGlmCj4gKwo+ICAvKiB0aGUgZm9sbG93aW5nIGFyZSByZWFsbHkgcmVhbGx5IG9wdGlv
bmFsICovCj4gIGV4dGVybiBzdHJ1Y3QgZnJlcV9hdHRyIGNwdWZyZXFfZnJlcV9hdHRyX3NjYWxp
bmdfYXZhaWxhYmxlX2ZyZXFzOwo+ICBleHRlcm4gc3RydWN0IGZyZXFfYXR0ciBjcHVmcmVxX2Zy
ZXFfYXR0cl9zY2FsaW5nX2Jvb3N0X2ZyZXFzOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
