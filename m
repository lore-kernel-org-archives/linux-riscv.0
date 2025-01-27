Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB366C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBE0GYpybfF54NmCIFk5jcLcCxueUtaaEfyQH7qFg0Y=; b=ZfvrObAkvrluQa
	D7eSBxcUbGfSRgrFdeY9lDcJuMb3eGoBaKoGi8dzpYUpDtRtOPPMmUIYdvPNtilLpx2Ap5bPL4PW6
	Qn6qUUZLDhb/fp+d3DUmCUeQ1B12/5nkY7EoRBHrD81/N67Cr8KIgW16jeaNb1cguAMXfpwXVH5q7
	u3EHc+M+E39MXjjkVaz79uqLTzfiPfBYOC+aN9KAujDZ2YOOugHtszgww7Sp9XM6RbQmOrznGG8Ck
	mimVEGM1RKMxoV5TkIK1NDcXX48E0TEJ6+wn+2JV+bTIkA4tWPTFso/pln7OcCfabOSlqFY1X0FD8
	1tiTYSdB+pvhTz9o5oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcN7F-00000002CTI-1TNX;
	Mon, 27 Jan 2025 11:17:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcN7A-00000002CR5-11rk
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 11:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737976629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0llw80E8nAjg6kMfEOzoPei4nanpbue7YefsY9gW++w=;
	b=COsELM3dgMzqvxES3yiE/1iCKTW6mckRJV7B8/AVvEmfEs3SAt58Asoo0IgFILoNYu5k29
	fBFSTjEQXJS4MWwknSPRBkiv8c2Xy/Cc+zdBfzbAHLOzoyM7Z/f6FRWzeb8BFXztoPRlie
	qe9GX2oHEkEnaCuf0iM8NV5Gi4TtJI8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-as3oM__9OrKBlwtFTYkzbA-1; Mon, 27 Jan 2025 06:17:08 -0500
X-MC-Unique: as3oM__9OrKBlwtFTYkzbA-1
X-Mimecast-MFC-AGG-ID: as3oM__9OrKBlwtFTYkzbA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385ed79291eso2297427f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 03:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976627; x=1738581427;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0llw80E8nAjg6kMfEOzoPei4nanpbue7YefsY9gW++w=;
        b=a7kJnG35FzsJkIm4gpcYahWmarFrERNbUpIczgMiihfNUxAOVXQgqfksOsw6QLOrP+
         4hO7aUaQfklIgoHK3R0x2FoddDoGI/F9IdlvXUmZQKbUtrnwKE52+BInquA80qkvW6kW
         c2MsAPXVvncnlWIzzPwy5lVDXYX693bTLrFibTm1Vg/iFUkf6kVcfe6HXEEKb9GcQjOa
         Dcj7f/K8f8ROo/lL3GjetCw5g3PQZQJqb+6GyTLcAGDdkElKrRThMbAFreFWU9cLhQeC
         2Aj+XypWMKN1I/+pyksOqRBtV84b+LLqQsPu2daB+ucpfjY19wpBKVfhpNt449Vmx73L
         E7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUxdbm678hALv18ScLx4suae1rsABtYDFT2435m1WFVpucJIe6y3kLF0niRmWvUS6CNweea06kpolX3AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQCWvaWSnoSng06lQ9gSGnYetirjdl4Pr6WEJZKYuovlnHcIr6
	dvYVs02wGVT50GzpQw2/ztdnwP55yATIP84j7YYTZ1BqufDNdSBPwH6bP0yo1ntYiuwtX1VeYWe
	kScfuFEGEXHyRdMnRgRRm5Mvpd+9tA3vqmv7snx7sVHPUSKavEsyLMUCvVt+uSCdMPQ==
X-Gm-Gg: ASbGnctXv5Hf+eZzptJnlLkRmdHsrARhko7J/gn8oQ8WJoSHAFCzBpZPcK3CwxXTRDC
	ZTYxXgqAr8KJejs2T1/sToJInRF3oTXFfMjHfeagIFck7ogAkl4ZjsLkxPIJ1EspLRSywv4TPmc
	xwwwLNae3CN/vNkVT8UFUdo62NSUUubCU23I0yfozMO5tX0SOElE8Qtjfx4uMHYccyiE2umPB1H
	hjirCos5y8ESskh0lmaq1UwjsrSyS6n2OwSKSo03cf2vheVH5ls/ojGvib31PQ0sL9Q6GQC7nsM
	3vHEW51NBCYI7CCCpRAXVSNsgiGGNyw6wkWpvrpnc9k5/hlrGKAd4q4n2sMv0HIiag==
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438bcfd440dmr101053155e9.0.1737976626880;
        Mon, 27 Jan 2025 03:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5ZBkhc7Mo57S55YqkWjUaKcE0DvJ7v1EsH72AA8CbL1E0vvN/eQHzrpNG4sI4i71C/vJTUQ==
X-Received: by 2002:a05:600c:6d46:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-438bcfd440dmr101052395e9.0.1737976626396;
        Mon, 27 Jan 2025 03:17:06 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a145sm128093025e9.16.2025.01.27.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 03:17:05 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org,
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
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Paul E. McKenney"
 <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
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
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
In-Reply-To: <Z5A6NPqVGoZ32YsN@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
Date: Mon, 27 Jan 2025 12:17:03 +0100
Message-ID: <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W4H_02UyaoIelFCANIh2fWvAfbxDeyR5afT5Yx-E90w_1737976627
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_031712_366650_76F54F83 
X-CRM114-Status: GOOD (  21.05  )
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

T24gMjIvMDEvMjUgMDE6MjIsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgVHVlLCBK
YW4gMTQsIDIwMjUgYXQgMDY6NTE6MzVQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gY3Rfbm1pX3tlbnRlciwgZXhpdH0oKSBvbmx5IHRvdWNoZXMgdGhlIFJDVSB3YXRj
aGluZyBjb3VudGVyIGFuZCBkb2Vzbid0Cj4+IG1vZGlmeSB0aGUgYWN0dWFsIENUIHN0YXRlIHBh
cnQgY29udGV4dF90cmFja2luZy5zdGF0ZS4gVGhpcyBtZWFucyB0aGF0Cj4+IHVwb24gcmVjZWl2
aW5nIGFuIElSUSB3aGVuIGlkbGUsIHRoZSBDVF9TVEFURV9JRExFLT5DVF9TVEFURV9LRVJORUwK
Pj4gdHJhbnNpdGlvbiBvbmx5IGhhcHBlbnMgaW4gY3RfaWRsZV9leGl0KCkuCj4+Cj4+IE9uZSBj
YW4gbm90ZSB0aGF0IGN0X25taV9lbnRlcigpIGNhbiBvbmx5IGV2ZXIgYmUgZW50ZXJlZCB3aXRo
IHRoZSBDVCBzdGF0ZQo+PiBhcyBlaXRoZXIgQ1RfU1RBVEVfS0VSTkVMIG9yIENUX1NUQVRFX0lE
TEUsIGFzIGFuIElSUS9OTUkgaGFwcGVubmluZyBpbiB0aGUKPj4gQ1RfU1RBVEVfVVNFUiBvciBD
VF9TVEFURV9HVUVTVCBzdGF0ZXMgd2lsbCBiZSByb3V0ZWQgZG93biB0byBjdF91c2VyX2V4aXQo
KS4KPgo+IEFyZSB5b3Ugc3VyZT8gQW4gTk1JIGNhbiBmaXJlIGJldHdlZW4gZ3Vlc3Rfc3RhdGVf
ZW50ZXJfaXJxb2ZmKCkgYW5kCj4gX19zdm1fdmNwdV9ydW4oKS4KClVyZ2gsIHlvdSdyZSBxdWl0
ZSByaWdodC4KCj4gQW5kIE5NSXMgaW50ZXJydXB0aW5nIHVzZXJzcGFjZSBkb24ndCBjYWxsCj4g
ZW50ZXJfZnJvbV91c2VyX21vZGUoKS4gSW4gZmFjdCB0aGV5IGRvbid0IGNhbGwgaXJxZW50cnlf
ZW50ZXJfZnJvbV91c2VyX21vZGUoKQo+IGxpa2UgcmVndWxhciBJUlFzIGJ1dCBpcnFlbnRyeV9u
bWlfZW50ZXIoKSBpbnN0ZWFkLiBXZWxsIHRoYXQncyBmb3IgYXJjaHMKPiBpbXBsZW1lbnRpbmcg
Y29tbW9uIGVudHJ5IGNvZGUsIEkgY2FuJ3Qgc3BlYWsgZm9yIHRoZSBvdGhlcnMuCj4KClRoYXQg
SSBkaWRuJ3QgcmVhbGl6ZSwgc28gdGhhbmsgeW91IGZvciBwb2ludGluZyBpdCBvdXQuIEhhdmlu
ZyBhbm90aGVyCmxvb2sgbm93LCBJIG1pc3Rvb2sgREVGSU5FX0lEVEVOVFJZX1JBVyhleGNfaW50
MykgZm9yIHRoZSBnZW5lcmFsIGNhc2UKd2hlbiBpdCByZWFsbHkgaXNuJ3QgOigKCj4gVW5pZnlp
bmcgdGhlIGJlaGF2aW91ciBiZXR3ZWVuIHVzZXIgYW5kIGlkbGUgc3VjaCB0aGF0IHRoZSBJUlFz
L05NSXMgZXhpdCB0aGUKPiBDVF9TVEFURSBjYW4gYmUgaW50ZXJlc3RpbmcgYnV0IEkgZmVhciB0
aGlzIG1heSBub3QgY29tZSBmb3IgZnJlZS4gWW91IHdvdWxkCj4gbmVlZCB0byBzYXZlIHRoZSBv
bGQgc3RhdGUgb24gSVJRL05NSSBlbnRyeSBhbmQgcmVzdG9yZSBpdCBvbiBleGl0Lgo+CgpUaGF0
J3Mgd2hhdCBJIHRyaWVkIHRvIGF2b2lkLCBidXQgaXQgc291bmRzIGxpa2UgdGhlcmUncyBubyBu
aWNlIHdheSBhcm91bmQgaXQuCgo+IERvIHdlIHJlYWxseSBuZWVkIGl0Pwo+CgpXZWxsLCBteSBw
cm9ibGVtIHdpdGggbm90IGRvaW5nIElETEUtPktFUk5FTCB0cmFuc2l0aW9ucyBvbiBJUlEvTk1J
IGlzIHRoYXQKdGhpcyBsZWFkcyB0aGUgSVBJIGRlZmVycmFsIGxvZ2ljIHRvIG9ic2VydmUgYSB0
ZWNobmljYWxseS1vdXQtb2Ytc3luYyBzYXRlCmZvciByZW1vdGUgQ1BVcy4gQ29uc2lkZXI6Cgog
IENQVXggICAgICAgICAgICBDUFV5CiAgICAgICAgICAgICAgICAgICAgc3RhdGUgOj0gQ1RfU1RB
VEVfSURMRQogICAgICAgICAgICAgICAgICAgIC4uLgogICAgICAgICAgICAgICAgICAgIH4+SVJR
CiAgICAgICAgICAgICAgICAgICAgLi4uCiAgICAgICAgICAgICAgICAgICAgY3Rfbm1pX2VudGVy
KCkKICAgICAgICAgICAgICAgICAgICBbaW4gdGhlIGtlcm5lbCBwcm9wZXIgYnkgbm93XQoKICB0
ZXh0X3Bva2VfYnBfYmF0Y2goKQogICAgY3Rfc2V0X2NwdV93b3JrKENQVXksIENUX1dPUktfU1lO
QykKICAgICAgUkVBRCBDUFV5IGN0LT5zdGF0ZQogICAgICBgLT4gQ1RfSURMRV9TVEFURQogICAg
ICBgLT4gZGVmZXIgSVBJCgoKSSB0aG91Z2h0IHRoaXMgbWVhbnQgSSB3b3VsZCBuZWVkIHRvIHRo
cm93IG91dCB0aGUgImRlZmVyIElQSXMgaWYgQ1BVIGlzCmlkbGUiIHBhcnQsIGJ1dCBBSVVJIHRo
aXMgYWxzbyBhZmZlY3RzIENUX1NUQVRFX1VTRVIgYW5kIENUX1NUQVRFX0dVRVNULAp3aGljaCBp
cyBhIGJ1bW1lciA6KAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
