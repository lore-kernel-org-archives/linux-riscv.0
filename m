Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12ABC02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVPVXgTQUYPyKYDTLVxtON18t2yn77vGzlp58m0VJb4=; b=TlyrBfsWEwxYfQ
	rEuVYFTCyqdlVN/wS4JYh26vtvii8y7W8RvfA9u0gB1vtAjj7wt4ejnYyCY1VRU2sMySX8aisiL7h
	tFSxk2zzCjq9onYDVt1jXpiPJWcka8Dpzf8IPRAgIcXR0nSfi51/DoyUgYC4Of21ddS/SvBUpPHya
	nACGoRJ+TeYfOsVkJcdGqWmvRoew3DUisR9KJn0zEy5GLabEHqx/zVzntyL0egkHfFAETtgcsxXB8
	E95TKhDBIAjXsiM1XdkZIXKrrQ4ZfYJx6m3no/+1i8chd5ahnLbwleZQs6SWkIjI/D/72ZdkfIfxa
	vwwUFijgrAl8eBrJaLZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpyg-00000000wPm-0uNN;
	Fri, 17 Jan 2025 17:17:50 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYowd-00000000jmA-398a;
	Fri, 17 Jan 2025 16:11:40 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-305d840926fso18090651fa.2;
        Fri, 17 Jan 2025 08:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737130297; x=1737735097; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mwf/8xvajfVfuiw0AKepwMJBFKP0lwWuKM/onBPK6d8=;
        b=c6ZX/W4TPAzOYgqwrfRTUriPy4Xv4XBc5gd4v2/bzBa00H/wwla1fdDU0COxUWm+9p
         jFw7qdKnoVMref+n0Q2TG1ktEOdsY/tik42LA4QaM4S2KlVztfdSvMCGtR2vGYAXf5EY
         BA79k7ZxQx/dhE8XeWQPE4ceWXOCCzwPH7C9VKHc/frmaf1rAqvZBIReUlcljxazCyoJ
         p92piYoo813ae9toJyRX0njmESguNcNX80o9kQXgkYdvY98HyfcbdZteiYCIlOTq5vpd
         h9PA3rRzizgKaAKUw+OsZyRnA+87rRHmozer8EEWzlEg2Zg61DO1FqhE3QcwqZXW/DFR
         T6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130297; x=1737735097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mwf/8xvajfVfuiw0AKepwMJBFKP0lwWuKM/onBPK6d8=;
        b=SffiUgTralAMP1HGpYU9AqXM6ARXZtkYDU8dqxQKyrq/O+wQIXLdwyU1NBuEbQrRFU
         LRQ8TMhd2pfHfUC/sJ1JNybpMmCiHaklWaEGOTVYHnxXgZJaTc8/Ml5BTbyom0KO5pyZ
         khCBgib3NoQGIXlKLiQ8dJTC6JjOMsJwAnvYehlwZh0xvC7fTgP53P5dvSvQrzQ0+wS1
         9tOEHmNFrGWsIahBbCaXhiZnDyN5VguPWkF5qzniKSRBtM1tjeMbZf7WwrGHxeufkg0M
         KYXWSjYoVo4UpSmnWBLCu81xPVnI7lUqjYTEfB541q3u6i/k3WwCLjgWsTC+47ncC1sv
         oUSA==
X-Forwarded-Encrypted: i=1; AJvYcCWHurEBhhmEFOI+aFeNO/mxQ/VqcSn+t+qRppM3a4GJDRW0ziqU2wfU+tfPC/N8TWrW61ELSMHRxGwFESw=@lists.infradead.org, AJvYcCWWrC2d3gE1ZeQUSehNlEb082U8jfXSPr+qVnOAprV2CJBFjNquCWE3HvsaxkZAxXE/WSCrKS+PnteL1jnHb74O@lists.infradead.org
X-Gm-Message-State: AOJu0YwF9e/TYa4KpSOcCysP0h5k4mjJnR8N/i0Ajz9WwA3oCpGtz+3i
	JFyHdmijOGj0TQlSBKxT21Jngospde2bp+gp6ji+R5KfnQuogGF6
X-Gm-Gg: ASbGnctshszv47C2V7wHb6hwooC1B0NKYcNRt0L0sgP9Sobo/aluGU5fuZAkaghlfQZ
	K4megNYA1j4AOZFdNVEt6ROeAKbWCDSA0Hp2NyAC0rxMN4r32BYF0ROaxN+nDdpKk8ReLBaUxQJ
	EMvgRtY+yA2YSx4HQz6m9ikgHENPLIzPv330XLAftR7gK/vTDuLlsS60VGLav3BJuZgshlOcD82
	jatPSAp3mZcsrPTlHYmE0UvncQJr+XhStK0gzZ3Px9FIIO+v5u+JxKKRjanNDngdlbZWRRyuBhN
	pfIaoBf9trs=
X-Google-Smtp-Source: AGHT+IFH9kfhzB42dITXdZg9xXnIuIrCtLCGkWK8kDwmfncKlFAzifmDHoUZVUHtKkW5iC7Zz8oHDA==
X-Received: by 2002:a2e:bc27:0:b0:302:40ec:a1b3 with SMTP id 38308e7fff4ca-3072caa166amr12690871fa.21.1737130297134;
        Fri, 17 Jan 2025 08:11:37 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com. [217.213.93.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed4bcsm4854351fa.71.2025.01.17.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:11:36 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 17 Jan 2025 17:11:30 +0100
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <Z4qBMqcMg16p57av@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_081139_786639_7DA4B13E 
X-CRM114-Status: GOOD (  25.97  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMDQ6MjU6NDVQTSArMDEwMCwgVmFsZW50aW4gU2NobmVp
ZGVyIHdyb3RlOgo+IE9uIDE0LzAxLzI1IDE5OjE2LCBKYW5uIEhvcm4gd3JvdGU6Cj4gPiBPbiBU
dWUsIEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVp
ZEByZWRoYXQuY29tPiB3cm90ZToKPiA+PiB2dW5tYXAoKSdzIGlzc3VlZCBmcm9tIGhvdXNla2Vl
cGluZyBDUFVzIGFyZSBhIHJlbGF0aXZlbHkgY29tbW9uIHNvdXJjZSBvZgo+ID4+IGludGVyZmVy
ZW5jZSBmb3IgaXNvbGF0ZWQgTk9IWl9GVUxMIENQVXMsIGFzIHRoZXkgYXJlIGhpdCBieSB0aGUK
PiA+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgSVBJcy4KPiA+Pgo+ID4+IEdpdmVuIHRoYXQg
Q1BVcyBleGVjdXRpbmcgaW4gdXNlcnNwYWNlIGRvIG5vdCBhY2Nlc3MgZGF0YSBpbiB0aGUgdm1h
bGxvYwo+ID4+IHJhbmdlLCB0aGVzZSBJUElzIGNvdWxkIGJlIGRlZmVycmVkIHVudGlsIHRoZWly
IG5leHQga2VybmVsIGVudHJ5Lgo+ID4+Cj4gPj4gRGVmZXJyYWwgdnMgZWFybHkgZW50cnkgZGFu
Z2VyIHpvbmUKPiA+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4+Cj4g
Pj4gVGhpcyByZXF1aXJlcyBhIGd1YXJhbnRlZSB0aGF0IG5vdGhpbmcgaW4gdGhlIHZtYWxsb2Mg
cmFuZ2UgY2FuIGJlIHZ1bm1hcCdkCj4gPj4gYW5kIHRoZW4gYWNjZXNzZWQgaW4gZWFybHkgZW50
cnkgY29kZS4KPiA+Cj4gPiBJbiBvdGhlciB3b3JkcywgaXQgbmVlZHMgYSBndWFyYW50ZWUgdGhh
dCBubyB2bWFsbG9jIGFsbG9jYXRpb25zIHRoYXQKPiA+IGhhdmUgYmVlbiBjcmVhdGVkIGluIHRo
ZSB2bWFsbG9jIHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+ID4gdGhlbiBiZSBh
Y2Nlc3NlZCBkdXJpbmcgZWFybHkgZW50cnksIHJpZ2h0Pwo+IAo+IEknbSBub3Qgc3VyZSBpZiB0
aGF0IHdvdWxkIGJlIGEgcHJvYmxlbSAobm90IGFuIG1tIGV4cGVydCwgcGxlYXNlIGRvCj4gY29y
cmVjdCBtZSkgLSBsb29raW5nIGF0IHZtYXBfcGFnZXNfcmFuZ2UoKSwgZmx1c2hfY2FjaGVfdm1h
cCgpIGlzbid0Cj4gZGVmZXJyZWQgYW55d2F5Lgo+IAo+IFNvIGFmdGVyIHZtYXBwaW5nIHNvbWV0
aGluZywgSSB3b3VsZG4ndCBleHBlY3QgaXNvbGF0ZWQgQ1BVcyB0byBoYXZlCj4gaW52YWxpZCBU
TEIgZW50cmllcyBmb3IgdGhlIG5ld2x5IHZtYXBwZWQgcGFnZS4KPiAKPiBIb3dldmVyLCB1cG9u
IHZ1bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUgVExCIGZsdXNoIGlzIGRlZmVycmVkLCBhbmQgdGh1
cwo+IHN0YWxlIFRMQiBlbnRyaWVzIGNhbiBhbmQgd2lsbCByZW1haW4gb24gaXNvbGF0ZWQgQ1BV
cywgdXAgdW50aWwgdGhleQo+IGV4ZWN1dGUgdGhlIGRlZmVycmVkIGZsdXNoIHRoZW1zZWx2ZXMg
KElPVyBmb3IgdGhlIGVudGlyZSBkdXJhdGlvbiBvZiB0aGUKPiAiZGFuZ2VyIHpvbmUiKS4KPiAK
PiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KPiAKUHJvYmFibHkgaSBhbSBtaXNzaW5nIHNvbWV0aGlu
ZyBhbmQgbmVlZCB0byBoYXZlIGEgbG9vayBhdCB5b3VyIHBhdGNoZXMsCmJ1dCBob3cgZG8geW91
IGd1YXJhbnRlZSB0aGF0IG5vLW9uZSBtYXAgc2FtZSBhcmUgdGhhdCB5b3UgZGVmZXIgZm9yIFRM
QgpmbHVzaGluZz8KCkFzIG5vdGVkIGJ5IEphbm4sIHdlIGFscmVhZHkgZGVmZXIgYSBUTEIgZmx1
c2hpbmcgYnkgYmFja2luZyBmcmVlZCBhcmVhcwp1bnRpbCBjZXJ0YWluIHRocmVzaG9sZCBhbmQg
anVzdCBhZnRlciB3ZSBjcm9zcyBpdCB3ZSBkbyBhIGZsdXNoLgoKLS0KVWxhZHppc2xhdSBSZXpr
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
