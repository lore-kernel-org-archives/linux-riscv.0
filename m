Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74167C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zu6SSzzCtk7yzS51etRQUxP5wxwmMJ1BXlOvq4NlP04=; b=thdIsmAfCoTG4K
	TN+U9b0o+JAFV766Wp1i7inxpB+ogAuSIurhXoccrWbuOiLrwUKZGcGp1A0Ak33wAfSnMrkiS8x5c
	Qu/OCc374XzMGILQHRDBykPfuu47yTRUYJu3rJPgcRx4l8snuMNpoS1v4b+UhR1wggw8TAFgEBNtw
	qoA4XzUiy+iBBiZeQNdv/eOxWT2DZIgBQ2Xzuwzi+tkn8wfIzkEmpr39RLfXWd0x4p1RTlYD79u3e
	XQMb8pR8nRV4m6cJVghQ+KfmPkdve49Z4asOSsFeLHhWtwQlN96RO7dW+w7sdJqAy8qwOJkac8o9U
	qr3L6I9FU/a10+NitU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyBk-00B3xQ-1y;
	Tue, 12 Dec 2023 08:32:24 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyBh-00B3w6-1z
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 08:32:22 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-67abd1879c0so35767206d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 00:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702369939; x=1702974739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4kqMN+HbgK8h0LRfiST0/gaIQ4yUhlUvwCL2KbU+eI=;
        b=qc22r22qbaR8C7AUpoIUa30kbwal029xzG/YOguMe87ih2kb3tD/XH+0aPt7SIThyz
         IEu2U/hNo/pJFsmev/NuKs7hRtK4Bjq+NK071j7ru3lX6KLychgGMBimUiDM/N1Jfu/b
         8hYktAL5MxoQ+6m1a+dkLeHx6b/qdMnXwODkDrPCO9o0JXjlRikFRviFSc+8TnmAWlYh
         aperGJ7K+trBZFnmyp+1a3PXkH15mooH7PrAzRsZx/UaIgWL/neW0YsxQeq8NUwO07ip
         26m1T5Kl2FCLbec+SOwQmagb44r6t5Mo0Piwv565zZ8upvGO/lrduwCmHeWg3LgOcXVi
         BqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702369939; x=1702974739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4kqMN+HbgK8h0LRfiST0/gaIQ4yUhlUvwCL2KbU+eI=;
        b=gPm0VWS39eiU3tDXmOTejy7x8bKttXwxwzc67oKAfbSkdLIA6nAFEW6gSw4cAsFbNI
         kuYhQhgjOqvIuYJ+nTDQQ/6Bki9UFqOHoaxSQFcJ3+uieBi4k/ieQDzfPxoXgGaMVWwl
         AH+MwBLdPWHuJlCartPApdNJOEcC9NyqfFNLP5Si98rWCS+IPjd1qgtjAYMNRhxk163h
         CNyYf6AHReYmiNiSxAoc4ohP55CnA/loAyE9efy3Y2W/jK9a9k8kgWOzNojfA85gzqeF
         Xm/rjbdORKhZhoyTjKYFSIPmLvFnfL/WRExi09NAJc5VcVM/OhkfL4X2U//AC1iGWTtX
         KKFw==
X-Gm-Message-State: AOJu0YyUMZcZogRP2RqzeQTLGfOE7YD4f44EFRx/11SAElFdrW6qGnnx
	Nwh37m2hz5/OCDz0wM7gPynynmbhqxXUgQ2wU6JOGQ==
X-Google-Smtp-Source: AGHT+IG0V6b2w6UWHUlW9pxYWTaS0uDQUzxhZQ4B06wFrRKsghNDJX6XvOe1qtLzaxB+JBeOLMSozUSB2UxByYZ/7u8=
X-Received: by 2002:a0c:be89:0:b0:67a:a721:7850 with SMTP id
 n9-20020a0cbe89000000b0067aa7217850mr5392942qvi.117.1702369938818; Tue, 12
 Dec 2023 00:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20231211104855.558096-1-vincent.guittot@linaro.org> <CAJZ5v0i37gGqt=oGC4BxJ4hT5pxhAdL7dPxGf7w3D8THqwAOwQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0i37gGqt=oGC4BxJ4hT5pxhAdL7dPxGf7w3D8THqwAOwQ@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 12 Dec 2023 09:32:06 +0100
Message-ID: <CAKfTPtDXLDpGChy7UXVsV75NHK1OPGHaGYf5G663HWnau4kAHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] consolidate and cleanup CPU capacity
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org, beata.michalska@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_003221_662772_46657FD8 
X-CRM114-Status: GOOD (  10.42  )
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

T24gTW9uLCAxMSBEZWMgMjAyMyBhdCAyMDo1MiwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgRGVjIDExLCAyMDIzIGF0IDExOjQ54oCvQU0g
VmluY2VudCBHdWl0dG90Cj4gPHZpbmNlbnQuZ3VpdHRvdEBsaW5hcm8ub3JnPiB3cm90ZToKClsu
Ll0KCj4gPgo+ID4gVmluY2VudCBHdWl0dG90ICg3KToKPiA+ICAgdG9wb2xvZ3k6IEFkZCBhIG5l
dyBhcmNoX3NjYWxlX2ZyZXFfcmVmZXJlbmNlCj4gPiAgIGNwdWZyZXE6IFVzZSB0aGUgZml4ZWQg
YW5kIGNvaGVyZW50IGZyZXF1ZW5jeSBmb3Igc2NhbGluZyBjYXBhY2l0eQo+ID4gICBjcHVmcmVx
L3NjaGVkdXRpbDogVXNlIGEgZml4ZWQgcmVmZXJlbmNlIGZyZXF1ZW5jeQo+ID4gICBlbmVyZ3lf
bW9kZWw6IFVzZSBhIGZpeGVkIHJlZmVyZW5jZSBmcmVxdWVuY3kKPiA+ICAgY3B1ZnJlcS9jcHBj
OiBNb3ZlIGFuZCByZW5hbWUgY3BwY19jcHVmcmVxX3twZXJmX3RvX2toenxraHpfdG9fcGVyZn0K
PiA+ICAgY3B1ZnJlcS9jcHBjOiBTZXQgdGhlIGZyZXF1ZW5jeSB1c2VkIGZvciBjb21wdXRpbmcg
dGhlIGNhcGFjaXR5Cj4gPiAgIGFybTY0L2FtdTogVXNlIGNhcGFjaXR5X3JlZl9mcmVxIHRvIHNl
dCBBTVUgcmF0aW8KPgo+IFRoaXMgc2VyaWVzIHRvdWNoZXMgbXVsdGlwbGUgcGxhY2VzLCBidXQg
bW9zdGx5IHNjaGVkdXRpbCwgY3B1ZnJlcSBhbmQKPiB0aGUgRU0sIHNvIHBsZWFzZSBsZXQgbWUg
a25vdyBpZiB5b3Ugd2FudCBtZSB0byBwaWNrIGl0IHVwLgoKVGhpcyBzZXJpZSBoYXMgYmVlbiBy
ZWJhc2VkIG9uIHRvcCBvZiB0aXAvY2hlZC9jb3JlIHRvIGZpeCBhIGNvbmZsaWN0CndpdGggYW5v
dGhlciBjaGFuZ2UgYWxyZWFkeSBxdWV1ZWQgaW4ga2VybmVsL3NjaGVkL2NwdWZyZXFfc2NoZWR1
dGlsLmMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
