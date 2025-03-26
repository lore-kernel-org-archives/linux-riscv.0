Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A126C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPq7IsiarzbfK30egn63t1FSbjfcQjJuo5gJbq88EV4=; b=MXJG7dT4gN51JP
	jyRqn5htsc21VitwcFNektl19F1HygFYN+sFMHGrJ4w0B5UymIgxvnI9pD7ObuE7/GjPVxJtJT9A1
	pKTRSzqv0RseJ89xj6xwBYWyFluIOkhLnFqA1EM7ROwj9jKdFE5ol27Hb6x2xCHSGDkCtqzDns5uF
	eujF8qLMt6nLALI8ZUmi6NuNmhcjEDwJ5Psxwa4y1erdmHJKNbpm0SXSUNjkOyxMNrhGC7AUEiaaG
	lxxrA20QbpzuyNsBNx492eTNxi6y0xORfXGMm8Cqf8+FyjBQan5CldytzUwoYJZrsoVoisx6ZFZZL
	B6CsnFdITeKMNy0IFIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMYc-00000007yTd-01Ew;
	Wed, 26 Mar 2025 08:56:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMYX-00000007yRh-2yYy
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 08:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742979372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctJ2iKS2diL395+WMoYK5u4EcCy52/qwtJ7bficlTlI=;
	b=Yfhi5Fezki67ljs+vfIlE/81Mso6xrv5nuZ7fPeDMK6fu7mYlLHIo9iF3mg3xgQKjY1yk1
	E6/zZwNvVWzbt+iBbMXz3X0SSRHG9FqnZ7aEsdMBo0H9uOLR6LjzHwbOHKoP0fae0k0K2u
	p/gGMSK+IreznDYsmXWDdt3ikTiZlDU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-bddANVFIMXew2-Hhy67s4w-1; Wed, 26 Mar 2025 04:56:11 -0400
X-MC-Unique: bddANVFIMXew2-Hhy67s4w-1
X-Mimecast-MFC-AGG-ID: bddANVFIMXew2-Hhy67s4w_1742979370
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso41723905e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 01:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979370; x=1743584170;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctJ2iKS2diL395+WMoYK5u4EcCy52/qwtJ7bficlTlI=;
        b=J+EJpErdGDeSp1KkD32UijRckXdB0ItJJr6RbR5iPSfm7Q07mV/m8fwq0RRLys0LCW
         QVKnX0Li55pJHPbb366RCwOE1W2grdea6Eo9fP8BQ20tOEe/9N/mscWp2B6XbOTCoY/j
         eHoZhINNi6VU0J7J/O+wBV3bRPc4a55AY+c1+BZScE+GqEA51Gr8lTbhu5dmMvgUmhY5
         0osVd55B85VGnEj6eftLhvI0m2hZEHr7jYbC5grNI9d+3PhR20s+D3MRNG9z5Uiap7Sx
         mMPfazQ85TFnoCZgYw8G0k96FsZUrgO2VbVgWXr8pNI7VKeHV6LNdc4n89TqY4HFSguJ
         xMQA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLzTWqbfdr0NcjhobEe1Qs+RSpVCVoQSe3hUmoCi0VE4o6ZTTwKYjiGIkXRvMj29jx+RXQ7KzB8rnYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnGPLdSjPFp8Q0cvZYHDkbZACqllxcM/TIiBMKq78NF7V9RqM+
	ocvjYMQbJzildMN4sRUwd4mgeDjYKhbrKSvCiOaA8OzN2q53ioat5bPn0NEL4VwmTCUTF8XI1tf
	Qjag8GRrLUJgHaH7nIrZ7+AeChyWdTsud369U/IkRdIlGFyp2zBkjnhxd7zvfUBwwlg==
X-Gm-Gg: ASbGncsCqtu7jA/6C5YVZ1c5OpkStay/o1vmFA1RAmFL3a7OBMceNk5+jLxH+AuZnb6
	rdBV0pyKgEXloQHj/VGBJ89sxBQxKXND/gqR6bJVQZmCeHBAT5zxVetNe3a7E7sOdDUb+jjrRbF
	RlDmAEYhw+q3tUqenVCsty78gahMAu+TFWhSmy3M+CaWFeE64s/K3UbU7yWEmxSJ5rVVS3V39F9
	bdPthNDtdT7MMQ3CZCet8tSdPM4PlDfZwaMVxXJEuJmdWou2SooiPoVplxLZuIDfsbsKkOLWDP0
	uIXm5dLCQQYSDXozoyTSBshv1SlBuRZOkDSJd7mDBNre7n21Xs45k8yQnoz/w0+mx6qBASJ+gx/
	0
X-Received: by 2002:a05:600c:5025:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43d509ea850mr177277705e9.9.1742979369920;
        Wed, 26 Mar 2025 01:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmtDcswSiHFvojL/8/X8XbIAG8pFv35YFW9PLdaiNFn4jtJsKwcY6xoArge3H5jo1mJzUGFA==
X-Received: by 2002:a05:600c:5025:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43d509ea850mr177277375e9.9.1742979369446;
        Wed, 26 Mar 2025 01:56:09 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac67970a2sm5909443f8f.16.2025.03.26.01.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:56:08 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
 <alexey.amakhalov@broadcom.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian
 Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmh5xlhk5p2.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez1EAATYcX520Nnw=P8XtUDSr5pe+qGH1YVNk3xN2LE05g@mail.gmail.com>
 <xhsmh34gkk3ls.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <352317e3-c7dc-43b4-b4cb-9644489318d0@intel.com>
 <xhsmhjz9mj2qo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d0450bc8-6585-49ca-9cad-49e65934bd5c@intel.com>
 <xhsmhh64qhssj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <eef09bdc-7546-462b-9ac0-661a44d2ceae@intel.com>
 <xhsmhfrk84k5k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com>
 <xhsmhy0wtngkd.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez2bSh6=J8cXJhqYX=Y8pXcGsFgC05HsGcF0b1sJK2VH7A@mail.gmail.com>
Date: Wed, 26 Mar 2025 09:56:06 +0100
Message-ID: <xhsmhv7rwnpax.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SFenjV1yFZEop9UfUgkrjfWOX1CKpIVHuSqsAvOm2EI_1742979370
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_015613_813461_C62FF65C 
X-CRM114-Status: GOOD (  23.47  )
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

T24gMjUvMDMvMjUgMTk6NDEsIEphbm4gSG9ybiB3cm90ZToKPiBPbiBUdWUsIE1hciAyNSwgMjAy
NSBhdCA2OjUy4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4gT24gMjAvMDIvMjUgMDk6MzgsIERhdmUgSGFuc2VuIHdyb3RlOgo+PiA+IEJ1dCwg
aG9uZXN0bHksIEknbSBzdGlsbCBub3Qgc3VyZSB0aGlzIGlzIHdvcnRoIGFsbCB0aGUgdHJvdWJs
ZS4gSWYKPj4gPiBmb2xrcyB3YW50IHRvIGF2b2lkIElQSXMgZm9yIFRMQiBmbHVzaGVzLCB0aGVy
ZSBhcmUgaGFyZHdhcmUgZmVhdHVyZXMKPj4gPiB0aGF0ICpETyogdGhhdC4gSnVzdCBnZXQgbmV3
IGhhcmR3YXJlIGluc3RlYWQgb2YgYWRkaW5nIHRoaXMgY29tcGxpY2F0ZWQKPj4gPiBwaWxlIG9m
IHNvZnR3YXJlIHRoYXQgd2UgaGF2ZSB0byBtYWludGFpbiBmb3JldmVyLiBJbiAxMCB5ZWFycywg
d2UnbGwKPj4gPiBzdGlsbCBoYXZlIHRoaXMgc29mdHdhcmUgKmFuZCogOTUlIG9mIG91ciBoYXJk
d2FyZSBoYXMgdGhlIGhhcmR3YXJlCj4+ID4gZmVhdHVyZSB0b28uCj4+Cj4+IFNvcnJ5LCB5b3Un
cmUgZ29pbmcgdG8gaGF2ZSB0byBkZWFsIHdpdGggbXkgaWdub3JhbmNlIGEgbGl0dGxlIGJpdCBs
b25nZXIuLi4KPj4KPj4gV2VyZSB5b3UgdGhpbmtpbmcgeDg2IGhhcmR3YXJlIHNwZWNpZmljYWxs
eSwgb3Igc29tZXRoaW5nIGVsc2U/Cj4+IEFJVUkgdGhpbmdzIGxpa2UgYXJtNjQncyBUTEJJVk1B
TExFMUlTIGNhbiBkbyB3aGF0IGlzIHJlcXVpcmVkIHdpdGhvdXQgYW55Cj4+IElQSToKPj4KPj4g
QzUuNS43OAo+PiAiIiIKPj4gVGhlIGludmFsaWRhdGlvbiBhcHBsaWVzIHRvIGFsbCBQRXMgaW4g
dGhlIHNhbWUgSW5uZXIgU2hhcmVhYmxlIHNoYXJlYWJpbGl0eSBkb21haW4gYXMgdGhlIFBFIHRo
YXQKPj4gZXhlY3V0ZXMgdGhpcyBTeXN0ZW0gaW5zdHJ1Y3Rpb24uCj4+ICIiIgo+Pgo+PiBCdXQg
Zm9yIChhdCBsZWFzdCkgdGhlc2UgYXJjaGl0ZWN0dXJlczoKPj4KPj4gICBhbHBoYQo+PiAgIHg4
Ngo+PiAgIGxvb25nYXJjaAo+PiAgIG1pcHMKPj4gICAobm9uLWZyZWVzY2FsZSA4eHgpIHBvd2Vy
cGMKPj4gICByaXNjdgo+PiAgIHh0ZW5zYQo+Pgo+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkg
aGFzIGEgcGF0aCB3aXRoIGEgaGFyZGNvZGVkIHVzZSBvZiBvbl9lYWNoX2NwdSgpLAo+PiBzbyBB
RkFJQ1QgZm9yIHRoZXNlIHRoZSBJUElzIHdpbGwgYmUgc2VudCBubyBtYXR0ZXIgdGhlIGhhcmR3
YXJlLgo+Cj4gT24gWDg2LCBib3RoIEFNRCBhbmQgSW50ZWwgaGF2ZSBzb21lIGZhaXJseSByZWNl
bnRseSBpbnRyb2R1Y2VkIENQVQo+IGZlYXR1cmVzIHRoYXQgY2FuIHNob290IGRvd24gVExCcyBy
ZW1vdGVseS4KPgo+IFRoZSBwYXRjaCBzZXJpZXMKPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjUwMjI2MDMwMTI5LjUzMDM0NS0xLXJpZWxAc3VycmllbC5jb20vPgo+IGFkZHMgc3Vw
cG9ydCBmb3IgdGhlIEFNRCBmbGF2b3I7IHRoYXQgc2VyaWVzIGxhbmRlZCBpbiB0aGUgY3VycmVu
dAo+IG1lcmdlIHdpbmRvdyAoaXQncyBwcmVzZW50IGluIHRoZSBtYWlubGluZSBnaXQgcmVwb3Np
dG9yeSBub3cgYW5kIHNob3VsZAo+IGJlIHBhcnQgb2YgNi4xNSkuIEkgdGhpbmsgc3VwcG9ydCBm
b3IgdGhlIEludGVsIGZsYXZvciBoYXMgbm90IHlldAo+IGJlZW4gaW1wbGVtZW50ZWQsIGJ1dCB0
aGUgbGlua2VkIHBhdGNoIHNlcmllcyBtZW50aW9ucyBhIHBsYW4gdG8gbG9vawo+IGF0IHRoZSBJ
bnRlbCBmbGF2b3IgbmV4dC4KClRoYW5rcyBmb3IgdGhlIGluZm8hCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
