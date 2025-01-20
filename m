Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A717C02185
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kYdA9pfn8L4QfS09FYiqpBL6xtnYhnTW3D/2R2qt58=; b=5EJW8ri0Oa5AML
	cSTCZyvLFbf5p4YxUI093BblGAuYSt3AeN5HkIHfuiRLDzHfsad9neQhlE46bI/XlkGLJPOQwgS3n
	qylL8vfPDKSV56NtddrzTbGQ0aSwVnYQYqf3fNKlgEwbcYtVlg2YuAF0APS4D1GQru/QxZhSxFabW
	Iq+l0JogduF4qfNcz3oTtZraDONtBsHmOu72UyAD8WS3Hi5hhZN01HUSUvzbHcFrIo5kSupL4+n3N
	Fc0fk52Cly2duxR3gYTNhr6CXIWei2XG1UVOBQ3kcDrsmWmHCzTcBkDZOgtst13QNS0+kdzjSK8qq
	kH8+TIoaxh8LGufckIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpl4-00000005PbV-2ESG;
	Mon, 20 Jan 2025 11:15:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZpkh-00000005PSO-2hAQ;
	Mon, 20 Jan 2025 11:15:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4415038e87.3;
        Mon, 20 Jan 2025 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737371729; x=1737976529; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2GVkq9tRDCkhxRDT/CBStGfoQ0If4+e8Z0FyGDV8QRs=;
        b=IG/cpH70Ss6gMKudgC3LBqOwbq1hnt7xrEqM33bE2e3DD3rveTsr7XSVYFT1TZOmk/
         sQ7BVkzt/RODqOor234KHLDQd4GM45Xw3gMpa4JlmpdTF5pKjcq0RFJMPH2YPF+Umh4Z
         wAuVvpM0T1FzR57CF1Ic0FGuJMFUDnzhLM6RsB6CP5DnjNvna8vVtuxUcMGR5LwhyElI
         /O8vhkl+SkHqgadAlc2GAxQSbY9XiIFY2tAx1vNoMrGo6cBB2/14XTV1QsmL1vI3fOfL
         CcTRnfhI2EkzwnwsHcglysa6zzLvfTfThyEyJeHndLG8h0lsVpFl8CosOQMGRuIZYRQT
         3h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371729; x=1737976529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GVkq9tRDCkhxRDT/CBStGfoQ0If4+e8Z0FyGDV8QRs=;
        b=TZHgq9P4qZGJ01pLlE+zkm5RC/bhnwktewncerpm2ZY01N4aW1cbi+o3lEDF8VrASQ
         gt4scbJUoNf2rfEDVViccPSt1BfXpfoyloISE8VQI5uzBnuzn2I+KzqlscsBJyO9JyUM
         KlRJY2KGgRFt0xlcir9H7w9pQzjsxPIbQ1RADEkBDGG3cOeEncJycwWB4+vL+YLY4WjU
         4zapGotZgYHxhOnXwG6Ajvu+p5BvKNF5TYT4Oq+r5a/3SM6mVqbDxhQodDl8AmF1wAsx
         hizrNDMjx9OnGa1AogMwvysJmWbc67M6Rk0pZCW2p12i5XZ28CtKr0+7BbUE8ZrBFnMP
         2m7w==
X-Forwarded-Encrypted: i=1; AJvYcCVw0Lf66xkqy2K7VdYFzca8/66wTDbkhhkin2WomVPALMa2k2SwJvdZXr8yVEvOpWU0shpLZi7tWN5j+2k=@lists.infradead.org, AJvYcCXGye0cz+vKLsuGEb/sa+MOetKCeXR8qsh3xuE1N0XFtGp1x7VuyTQzpQGVOK355wDYU2FTxUCqpl/TJ4Y6FSZ1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0flodPlaNTfy1KwfSnfXHA0PPdvQW5c8MuG2JMIDh2PIZiqqC
	KP82AO9tIza6trypRzvrlqDA51CMZt8EbHIqHy+WZBQzDQNCig/8
X-Gm-Gg: ASbGncvoAq68JntaP8PDWGw+tm1LO7RleK5kAiEI2NriqgTgzSjZLaa2yC8Mc6In2oY
	nhKtke5Jp51+hIcsQejqg9y2LDnIOsSydzlksedK92qxQAQLNjvpvUHNHwRQleSMYWZASY6jsG6
	ZsLv5MiA67el26ctvAqCm34HutqXeIj2vUS38qCE+JUq9+ZFEnXHnDIJXyAwJP+vxUZRd7IhGVB
	rtiV8DGXfDncAcVQ2UkRida7BcynjdpxKWWvWFEOCK5dOeG7CAWXm6mz57yaueDy82uKvPDiHnL
	LoMnYsfYqRHhfduuyqWwuC0R
X-Google-Smtp-Source: AGHT+IHKV/b4OpTja4V+3bSeLRqiI1pV4ugkz/2qcipp1USPLcCJuF4RKlBH/zOnSXkuGgwcoGAG8A==
X-Received: by 2002:ac2:4155:0:b0:542:8cf5:a3a3 with SMTP id 2adb3069b0e04-5439c216c23mr3426183e87.5.1737371729069;
        Mon, 20 Jan 2025 03:15:29 -0800 (PST)
Received: from pc636 (host-217-213-93-172.mobileonline.telia.com. [217.213.93.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60936sm1298036e87.107.2025.01.20.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 03:15:27 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 20 Jan 2025 12:15:20 +0100
To: Valentin Schneider <vschneid@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
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
Message-ID: <Z44wSJTXknQVKWb0@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_031531_683982_4B4D2E79 
X-CRM114-Status: GOOD (  34.49  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMDY6MDA6MzBQTSArMDEwMCwgVmFsZW50aW4gU2NobmVp
ZGVyIHdyb3RlOgo+IE9uIDE3LzAxLzI1IDE3OjExLCBVbGFkemlzbGF1IFJlemtpIHdyb3RlOgo+
ID4gT24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMDQ6MjU6NDVQTSArMDEwMCwgVmFsZW50aW4gU2No
bmVpZGVyIHdyb3RlOgo+ID4+IE9uIDE0LzAxLzI1IDE5OjE2LCBKYW5uIEhvcm4gd3JvdGU6Cj4g
Pj4gPiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVy
IDx2c2NobmVpZEByZWRoYXQuY29tPiB3cm90ZToKPiA+PiA+PiB2dW5tYXAoKSdzIGlzc3VlZCBm
cm9tIGhvdXNla2VlcGluZyBDUFVzIGFyZSBhIHJlbGF0aXZlbHkgY29tbW9uIHNvdXJjZSBvZgo+
ID4+ID4+IGludGVyZmVyZW5jZSBmb3IgaXNvbGF0ZWQgTk9IWl9GVUxMIENQVXMsIGFzIHRoZXkg
YXJlIGhpdCBieSB0aGUKPiA+PiA+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgSVBJcy4KPiA+
PiA+Pgo+ID4+ID4+IEdpdmVuIHRoYXQgQ1BVcyBleGVjdXRpbmcgaW4gdXNlcnNwYWNlIGRvIG5v
dCBhY2Nlc3MgZGF0YSBpbiB0aGUgdm1hbGxvYwo+ID4+ID4+IHJhbmdlLCB0aGVzZSBJUElzIGNv
dWxkIGJlIGRlZmVycmVkIHVudGlsIHRoZWlyIG5leHQga2VybmVsIGVudHJ5Lgo+ID4+ID4+Cj4g
Pj4gPj4gRGVmZXJyYWwgdnMgZWFybHkgZW50cnkgZGFuZ2VyIHpvbmUKPiA+PiA+PiA9PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4+ID4+Cj4gPj4gPj4gVGhpcyByZXF1aXJl
cyBhIGd1YXJhbnRlZSB0aGF0IG5vdGhpbmcgaW4gdGhlIHZtYWxsb2MgcmFuZ2UgY2FuIGJlIHZ1
bm1hcCdkCj4gPj4gPj4gYW5kIHRoZW4gYWNjZXNzZWQgaW4gZWFybHkgZW50cnkgY29kZS4KPiA+
PiA+Cj4gPj4gPiBJbiBvdGhlciB3b3JkcywgaXQgbmVlZHMgYSBndWFyYW50ZWUgdGhhdCBubyB2
bWFsbG9jIGFsbG9jYXRpb25zIHRoYXQKPiA+PiA+IGhhdmUgYmVlbiBjcmVhdGVkIGluIHRoZSB2
bWFsbG9jIHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+ID4+ID4gdGhlbiBiZSBh
Y2Nlc3NlZCBkdXJpbmcgZWFybHkgZW50cnksIHJpZ2h0Pwo+ID4+Cj4gPj4gSSdtIG5vdCBzdXJl
IGlmIHRoYXQgd291bGQgYmUgYSBwcm9ibGVtIChub3QgYW4gbW0gZXhwZXJ0LCBwbGVhc2UgZG8K
PiA+PiBjb3JyZWN0IG1lKSAtIGxvb2tpbmcgYXQgdm1hcF9wYWdlc19yYW5nZSgpLCBmbHVzaF9j
YWNoZV92bWFwKCkgaXNuJ3QKPiA+PiBkZWZlcnJlZCBhbnl3YXkuCj4gPj4KPiA+PiBTbyBhZnRl
ciB2bWFwcGluZyBzb21ldGhpbmcsIEkgd291bGRuJ3QgZXhwZWN0IGlzb2xhdGVkIENQVXMgdG8g
aGF2ZQo+ID4+IGludmFsaWQgVExCIGVudHJpZXMgZm9yIHRoZSBuZXdseSB2bWFwcGVkIHBhZ2Uu
Cj4gPj4KPiA+PiBIb3dldmVyLCB1cG9uIHZ1bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUgVExCIGZs
dXNoIGlzIGRlZmVycmVkLCBhbmQgdGh1cwo+ID4+IHN0YWxlIFRMQiBlbnRyaWVzIGNhbiBhbmQg
d2lsbCByZW1haW4gb24gaXNvbGF0ZWQgQ1BVcywgdXAgdW50aWwgdGhleQo+ID4+IGV4ZWN1dGUg
dGhlIGRlZmVycmVkIGZsdXNoIHRoZW1zZWx2ZXMgKElPVyBmb3IgdGhlIGVudGlyZSBkdXJhdGlv
biBvZiB0aGUKPiA+PiAiZGFuZ2VyIHpvbmUiKS4KPiA+Pgo+ID4+IERvZXMgdGhhdCBtYWtlIHNl
bnNlPwo+ID4+Cj4gPiBQcm9iYWJseSBpIGFtIG1pc3Npbmcgc29tZXRoaW5nIGFuZCBuZWVkIHRv
IGhhdmUgYSBsb29rIGF0IHlvdXIgcGF0Y2hlcywKPiA+IGJ1dCBob3cgZG8geW91IGd1YXJhbnRl
ZSB0aGF0IG5vLW9uZSBtYXAgc2FtZSBhcmUgdGhhdCB5b3UgZGVmZXIgZm9yIFRMQgo+ID4gZmx1
c2hpbmc/Cj4gPgo+IAo+IFRoYXQncyB0aGUgY29vbCBwYXJ0OiBJIGRvbid0IDonKQo+IApJbmRl
ZWQsIHNvdW5kcyB1bnNhZmUgOikgVGhlbiB3ZSBqdXN0IGRvIG5vdCBuZWVkIHRvIGZyZWUgYXJl
YXMuCgo+IEZvciBkZWZlcnJpbmcgaW5zdHJ1Y3Rpb24gcGF0Y2hpbmcgSVBJcywgSSAod2VsbCBK
b3NoIHJlYWxseSkgbWFuYWdlZCB0bwo+IGdldCBpbnN0cnVtZW50YXRpb24gdG8gYmFjayBtZSB1
cCBhbmQgY2F0Y2ggYW55IHByb2JsZW1hdGljIGFyZWEuCj4gCj4gSSBsb29rZWQgaW50byBnZXR0
aW5nIHNvbWV0aGluZyBzaW1pbGFyIGZvciB2bWFsbG9jIHJlZ2lvbiBhY2Nlc3MgaW4KPiAubm9p
bnN0ciBjb2RlLCBidXQgSSBkaWRuJ3QgZ2V0IGFueXdoZXJlLiBJIGV2ZW4gdHJpZWQgdXNpbmcg
ZW11bGF0ZWQKPiB3YXRjaHBvaW50cyBvbiBRRU1VIHRvIHdhdGNoIHRoZSB3aG9sZSB2bWFsbG9j
IHJhbmdlLCBidXQgdGhhdCB3ZW50IGFib3V0Cj4gYXMgd2VsbCBhcyB5b3UgY291bGQgZXhwZWN0
Lgo+IAo+IFRoYXQgbGVmdCBtZSB3aXRoIHN0YXJpbmcgYXQgY29kZS4gQUZBSUNUIHRoZSBvbmx5
IHZtYXAnZCB0aGluZyB0aGF0IGlzCj4gYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5IGlzIHRo
ZSB0YXNrIHN0YWNrIChDT05GSUdfVk1BUF9TVEFDSyksIHdoaWNoCj4gaXRzZWxmIGNhbm5vdCBi
ZSBmcmVlZCB1bnRpbCB0aGUgdGFzayBleGl0cyAtIHRodXMgY2FuJ3QgYmUgc3ViamVjdCB0bwo+
IGludmFsaWRhdGlvbiB3aGVuIGEgdGFzayBpcyBlbnRlcmluZyBrZXJuZWxzcGFjZS4KPiAKPiBJ
ZiB5b3UgaGF2ZSBhbnkgdHJhY2luZy9pbnN0cnVtZW50YXRpb24gc3VnZ2VzdGlvbnMsIEknbSBh
bGwgZWFycyAoZXllcz8pLgo+IApBcyBub3RlZCBiZWZvcmUsIHdlIGRlZmVyIGZsdXNoaW5nIGZv
ciB2bWFsbG9jLiBXZSBoYXZlIGEgbGF6eS10aHJlc2hvbGQKd2hpY2ggY2FuIGJlIGV4cG9zZWQo
aWYgeW91IG5lZWQgaXQpIG92ZXIgc3lzZnMgZm9yIHR1bmluZy4gU28sIHdlIGNhbiBhZGQgaXQu
CgotLQpVbGFkemlzbGF1IFJlemtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
