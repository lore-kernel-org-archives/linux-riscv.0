Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBFBCCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/cKuOI+W2C/RQojwOobWgrkxW+atS+SEVt/Qk/yts0=; b=1Ga/M1pcajsNdI
	rvBqT3fBihOfQ2KmRSQQ5h13Dx5mUs04Ds287FBkACn5pcHowcA9r5rFPMEgevRflTQUgpQ+pQaRY
	t6Ff/jwxJb58PQuWOnySVju9cn8bL127lPw72XQzpJ1MSwQ79HDTaCRlLr4HpBsn9bY5iHxzdus0r
	FamQSHxTLqXQLR07OVfuMOfh7hFWXAVqT0OBJmriU4Bzr/7bxg8AwLX8uj0iB6iLTa2KBId1WQIll
	wDnjQfiqX8aP2xxYm0crrksLQCUgUECUYd6p789nrlxj85eHiRJKoURgj1vwYhe+7VExR5SpZfVUt
	H6AHt6PpbMeieFEU5Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3UL-00000000n5i-0ekV;
	Wed, 29 Oct 2025 10:33:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3UI-00000000n3b-11WF
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761733985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TDebEJmKrapkTDm2SQS84/R7MOsdaEIy1zvcb82V9E=;
	b=aGz4Uj62tPQ5PpVyRlBC+Q+GeWy1wSvUaM6RUGz6q4pBALjCQaTEYVo4VitJ/Q9epTV/1q
	H/IDkPHQtHBBbTqk7OVREn80y+strwKgqFuzyXry+n5m9Py/sM+82SHtapX0rrAxB4tUSK
	ufC47rVkEzbqloR3HRvZIHguD+lWlCI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-v6Ph2lPePRm0Xo96nTvYKA-1; Wed, 29 Oct 2025 06:33:04 -0400
X-MC-Unique: v6Ph2lPePRm0Xo96nTvYKA-1
X-Mimecast-MFC-AGG-ID: v6Ph2lPePRm0Xo96nTvYKA_1761733983
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47106720618so50965235e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 03:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733983; x=1762338783;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJM20FESPr5Q3wolT/mFDxUYnwba82V6xz3P+wmiM7o=;
        b=bYE5dsdUWF/82ZuVyn0odVpcSWE0N1GaHALad3zWhrrzYfy5MUNqlMBqKJrP9rw7hX
         IKWAuWPetqRVw3susDbt+LjOHoFPxthwEyLh9cnryZVo78TCAY7S7pIi4xD++VNivEKG
         n55vv3dNpxDJxRf4zJy+ffiXRmkXZsiPEFedOETmBbWCnuXNMRZBbb+8E3dXI0tNCorP
         O+qWvfhMKXVba28HIAjV/k4HTVkHhYBR57fqYhIT9zEATASfwiM4Fg9WetXjJM4BqGo3
         FVY5kbn0hN4OcbqkIR5RIeTVPBBHYFaf7tbGyD/VUWS8UxqrT3pjTU9pwgGqo0a5Wxh2
         kuvA==
X-Forwarded-Encrypted: i=1; AJvYcCVERsHSNS2zgcYFJUPe45h8xxhhT6lKY9fTi9gVgoNywLR8dmOdeBfAPgjbVprCjp1lfekbtVTXo1p1Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykDQZ5zFkoBop5rcHfVRlis/XOuTH+94Z1Di3RHIoP1hnupNPb
	4OhOvErxV5eoSNWws2a4qB36ggrKPQcKu74Qu63c0HaVKHiwjqzCEtC8DTrSAtjlVvZSthjuezQ
	3Wpc0/dUvGZ4QBk3NRVLNe3m5m4gh5upWnh4XOijXPeTfo4fxQdrab6Jvcts5VvV9pSJOxw==
X-Gm-Gg: ASbGnct7TUQEUCnY0CKmWWYexCQ19aXcZlTtonAK0Xjdfmrzj1VvGN2TO5kRaQzWGto
	gUEOnnI0i9XeFo/J7maCJmEWtJF2dbgMLjmwHx5YcoRU5A/gfPVzZfJKXQ1QPI3+8egi2B+warT
	G+JrSnASyHmt7E29GUjlaITO7ai4HL9VmZvcqXmmFi99wzPrbbDnhZzaVCkk8WIMTshNGmiQfba
	fAJNOJbZwiaT2+kuTRBdeVb26TIAzQpfu5jmrfaG1O21mTHLZmP/QtE5zxctX3h9wdTCo8gWD/P
	eTN10eojKt5GEv0cTTEDODynVOTX1q33JQKCDIshKhzcOeH3cRhSEj8vAeiooizmt8nTCFgdoEx
	EuQ4DhcSZhH3BsHGPku+4lTxaTfbX0sUJHrXcrB/31VEOM/93sFPUK68+F1xe
X-Received: by 2002:a05:600c:64c4:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4771e1da0c8mr21410305e9.22.1761733982878;
        Wed, 29 Oct 2025 03:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxlh/PGW1+wNXuO1RQYN4fEeAqw5AdQXtt4ynjbr63hSK8Qg5GeiiDecSDqHTa53KxpVgVKg==
X-Received: by 2002:a05:600c:64c4:b0:477:bb0:7528 with SMTP id 5b1f17b1804b1-4771e1da0c8mr21408835e9.22.1761733981314;
        Wed, 29 Oct 2025 03:33:01 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm25638297f8f.4.2025.10.29.03.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:33:00 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>, Phil Auld <pauld@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, "David S. Miller" <davem@davemloft.net>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQDuY3rgOK-L8D04@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
Date: Wed, 29 Oct 2025 11:32:58 +0100
Message-ID: <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I_7gUozor6-f0D7XFUF5bKlN3xpZrrJT3_nZla8W2pw_1761733983
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033306_348087_403A0046 
X-CRM114-Status: GOOD (  25.74  )
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

T24gMjgvMTAvMjUgMTc6MjUsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gK0NjIFBoaWwg
QXVsZAo+Cj4gTGUgRnJpLCBPY3QgMTAsIDIwMjUgYXQgMDU6Mzg6MTBQTSArMDIwMCwgVmFsZW50
aW4gU2NobmVpZGVyIGEgw6ljcml0IDoKPj4gUGF0Y2hlcwo+PiA9PT09PT09Cj4+Cj4+IG8gUGF0
Y2hlcyAxLTIgYXJlIHN0YW5kYWxvbmUgb2JqdG9vbCBjbGVhbnVwcy4KPgo+IFdvdWxkIGJlIG5p
Y2UgdG8gZ2V0IHRoZXNlIG1lcmdlZC4KPgo+PiBvIFBhdGNoZXMgMy00IGFkZCBhbiBSQ1UgdGVz
dGluZyBmZWF0dXJlLgo+Cj4gSSdtIHRha2luZyB0aGlzIG9uZS4KPgoKVGhhbmtzIQoKPj4KPj4g
byBQYXRjaGVzIDUtNiBhZGQgaW5mcmFzdHJ1Y3R1cmUgZm9yIGFubm90YXRpbmcgc3RhdGljIGtl
eXMgYW5kIHN0YXRpYyBjYWxscwo+PiAgIHRoYXQgbWF5IGJlIHVzZWQgaW4gbm9pbnN0ciBjb2Rl
IChjb3VydGVzeSBvZiBKb3NoKS4KPj4gbyBQYXRjaGVzIDctMjAgdXNlIHNhaWQgYW5ub3RhdGlv
bnMgb24gcmVsZXZhbnQga2V5cyAvIGNhbGxzLgo+PiBvIFBhdGNoIDIxIGVuZm9yY2VzIHByb3Bl
ciB1c2FnZSBvZiBzYWlkIGFubm90YXRpb25zIChjb3VydGVzeSBvZiBKb3NoKS4KPj4KPj4gbyBQ
YXRjaCAyMiBkZWFscyB3aXRoIGRldGVjdGluZyBOT0lOU1RSIHRleHQgaW4gbW9kdWxlcwo+Cj4g
Tm90IHN1cmUgaG93IHRvIHJvdXRlIHRob3NlLiBJZiB3ZSB3YWl0IGZvciBlYWNoIGluZGl2aWR1
YWwgc3Vic3lzdGVtLAo+IHRoaXMgbWF5IHRha2UgYSB3aGlsZS4KPgoKQXQgbGVhc3QgdGhlIF9f
cm9fYWZ0ZXJfaW5pdCBvbmVzIGNvdWxkIGdvIGFzIHRoZWlyIG93biB0aGluZyBzaW5jZSB0aGV5
J3JlCnN0YW5kYWxvbmUsIGJ1dCB5ZWFoIHRoZXkncmUgdGhlIG9uZXMgdG91Y2hpbmcgYWxsIHNv
cnRzIG9mIHN1YnN5c3RlbXMgOi8KCj4+IG8gUGF0Y2hlcyAyMy0yNCBkZWFsIHdpdGgga2VybmVs
IHRleHQgc3luYyBJUElzCj4KPiBJIHdvdWxkIGJlIGZpbmUgdGFraW5nIHRob3NlICh0aGUgY29u
Y2VybnMgSSBoYWQgYXJlIGp1c3QgZGV0YWlscykKPiBidXQgdGhleSBkZXBlbmQgb24gYWxsIHRo
ZSBhbm5vdGF0aW9ucy4gQWx0ZXJuYXRpdmVseSBJIGNhbiB0YWtlIHRoZSB3aG9sZQo+IHRoaW5n
IGJ1dCB0aGVuIHdlJ2xsIG5lZWQgc29tZSBhY2tzLgo+Cj4+IG8gUGF0Y2hlcyAyNS0yOSBkZWFs
IHdpdGgga2VybmVsIHJhbmdlIFRMQiBmbHVzaCBJUElzCj4KPiBJJ2xsIGxlYXZlIHRoZXNlIG1v
cmUgdGltZSBmb3Igbm93IDtvKQo+IEFuZCBpZiB0aGV5IGV2ZXIgZ28gc29tZXdoZXJlLCBpdCBz
aG91bGQgYmUgdGhyb3VnaCB4ODYgdHJlZS4KPgo+IEFsc28sIGhlcmUgaXMgYW5vdGhlciBjYW5k
aWRhdGUgdXNlY2FzZSBmb3IgdGhpcyBkZWZlcnJhbCB0aGluZy4KPiBJIHJlbWVtYmVyIFBoaWwg
QXVsZCBjb21wbGFpbmluZyB0aGF0IHN0b3BfbWFjaGluZSgpIG9uIENQVSBvZmZsaW5pbmcgd2Fz
Cj4gYSBiaWcgcHJvYmxlbSBmb3Igbm9oel9mdWxsLiBFc3BlY2lhbGx5IHdoaWxlIHdlIGFyZSB3
b3JraW5nIG9uCj4gYSBjcHVzZXQgaW50ZXJmYWNlIHRvIHRvZ2dsZSBub2h6X2Z1bGwgYnV0IHRo
aXMgd2lsbCByZXF1aXJlIHRoZSBDUFVzCj4gdG8gYmUgb2ZmbGluZS4KPgoKWWVhaCB0aGF0IGRv
ZXMgcmluZyBhIGJlbGwuLi4KCj4gU28gbXkgcG9pbnQgaXMgdGhhdCB3aGVuIGEgQ1BVIGdvZXMg
b2ZmbGluZSwgc3RvcF9tYWNoaW5lKCkgcHV0cyBhbGwKPiBDUFVzIGludG8gYSBsb29wIHdpdGgg
SVJRcyBkaXNhYmxlZC4gQ1BVcyBpbiB1c2Vyc3BhY2UgY291bGQgcG9zc2libHkKPiBlc2NhcGUg
dGhhdCBzaW5jZSB0aGV5IGRvbid0IHRvdWNoIHRoZSBrZXJuZWwgYW55d2F5LiBCdXQgYXMgc29v
biBhcwo+IHRoZXkgZW50ZXIgdGhlIGtlcm5lbCwgdGhleSBzaG91bGQgZWl0aGVyIGFjcXVpcmUg
dGhlIGZpbmFsIHN0YXRlIG9mCj4gc3RvcF9tYWNoaW5lIGlmIGNvbXBsZXRlZCBvciBqb2luIHRo
ZSBnbG9iYWwgbG9vcCBpZiBpbiB0aGUgbWlkZGxlLgo+CgpJIG5lZWQgdG8gaGF2ZSBhIHRoaW5r
IGFib3V0IHRoYXQgb25lOyBvbmUgcGFpbiBwb2ludCBJIHNlZSBpcyB0aGUgY29udGV4dAp0cmFj
a2luZyB3b3JrIGhhcyB0byBiZSBOTUkgc2FmZSBzaW5jZSBlLmcuIGFuIE5NSSBjYW4gdGFrZSB1
cyBvdXQgb2YKdXNlcnNwYWNlLiBBbm90aGVyIGlzIHRoYXQgTk9IWi1mdWxsIENQVXMgbmVlZCB0
byBiZSBzcGVjaWFsIGNhc2VkIGluIHRoZQpzdG9wIG1hY2hpbmUgcXVldWVpbmcgLyBjb21wbGV0
aW9uLgoKL21lIGdvZXMgZmV0Y2ggYSBuZXcgbm90ZWJvb2sKCj4gVGhhbmtzLgo+Cj4gLS0KPiBG
cmVkZXJpYyBXZWlzYmVja2VyCj4gU1VTRSBMYWJzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
