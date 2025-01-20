Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ABBC02182
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pHcafhchqiRgrhxSNre9lRqe0g2VJNzmCQgT5zXXIk=; b=gpfmzib9RK5xUR
	ZBDQ7oSl9XhBD6UHt2OOH4vJkuH028rGPeZ0KaiMjmtynyS+BRHVaa0w+aA/MaVfuagTciWqy0qIK
	BF0BwSAQn1aFHutrLkqfgfRlW9478S5cyO3okj5v6IKx5cejeIcsSupIQlKNoDnfwXHR2aAD22Wie
	HJsJBtmYnTNdB/44avK137VTojrwb5jo2UP04bnc+dcZsrpf3W4lQxx3OvkN9c/Oq3pfzeI7NZp1Z
	qvmNbmy02Yha5TmZiC1kuk0KzhExKioQYHhwMqON7Qitx6A39ApBCgGhDZjWi8awLg5wXQE5P+fQy
	5zXjG/G6GEwf9uaSC28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuLR-00000005xUH-43nT;
	Mon, 20 Jan 2025 16:09:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuLO-00000005xSH-2KiJ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737389381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SNeDTVMDd6LFz2Ibm+JZz5IT863oQDJPOaC5/U8lcJk=;
	b=YCuIi2gqY27/RenYo+i67O1JK7ekVse6cs1fAn7xO6n6ukpSgzz3wokTwcvwoSIDPChQFO
	yupdrm0+05XyuGVby5P4zH4FFDrt382SGWD+3X6j1lkD4aqbEDrQBw4NKoLCHKliqBmMj5
	WCxV8GAHEnJFtnnMaRdblDg5U18r8xM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-3EQGWI4CM66L-f6cR-OEgg-1; Mon, 20 Jan 2025 11:09:39 -0500
X-MC-Unique: 3EQGWI4CM66L-f6cR-OEgg-1
X-Mimecast-MFC-AGG-ID: 3EQGWI4CM66L-f6cR-OEgg
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385e3cbf308so2001058f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 08:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737389378; x=1737994178;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPYF3/ytKmNcBW6xY8UN6OXUapKiaxgyBXzq3dB0L9c=;
        b=MrZsBb+RyQuQBnfo7QoXlhaVNKjWTHm+TLFS4OgrQ8nV1PKgjcoD3GYbjcK7vcgGbu
         QOuW49y55Fa9aICK4vrTfPbFEbnSYqQUF8T/d9K1M42CWBhpKXCw32YZyn5QjXfaI76r
         Ur3R4QXi3Z2fr0KTJDZRpUeE0vk5LK8Asl6HcFO8n2pBzufzrCLpLZQ+MyRWKJUJ8jYP
         sO9h0e3VtIi6uL4lwacPNIws6UCxn7jH3NRZU54RAKCtM/vcoawOHWVyA7AVZ6Z2VXdI
         d9yejb27aAe0p2LBihnjuCKKeyca7aQyDtwkah2i0BvVZ62NvQeZ6tRFTEu7pCBL0TrH
         SC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHTTzxKvmUU7f9fDPZSFDpIg5hTP8+uOO8xDvWoBHUBkDYi6YBF06haGk9ZxJ4E300dMIxC3/6/Ac5lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwANpXskR4lV8L2j3KS3xmgjHieuXnnscJsH8mtxWzihT5rtl7v
	tiEPeEy0uVO8dyxa0pyfDYqPh6saIYMv/512SIwR/5+qXAH0hwmWrBQGXUf5G9YOYnDooM1KMob
	CvHWraK4kVzuDSh5avEs363SW6wk4EdoSrFDvwzpSx3YDQgxMOCtu4WLpISkVRBC99g==
X-Gm-Gg: ASbGncskrzx2C6PkyGfFAngjz6oKESLIJgonDiuUPEgg4wgbaLgL/ZYayC9rsQgIKWB
	V7J2AGSM7EO6Dn5y1KsG1sWPL4U3bW4QCpkuyvGfjCf2hGbECdU7JxdFHQjtdQb41LRsFxQjovE
	pR0f5SS3/wCWecX8dj7sqgmQ4lC7PQrUkQcwZ8AKlPyQivZ6iahmn7mbmwVQouTIQ9/LXT0vh77
	dS9bUBZ/4Vz0MsnDJCu88qCks8Yl0XyuW4l561R8o0D6YD1sQu7BPlmxh+dzGyIlpZxXecibGXG
	NzigVaaaHauLIEeJFV5aLa/wBLx2P7pJmwrPZLIR0mSh9ag1sxzU/dk=
X-Received: by 2002:adf:f682:0:b0:38b:e26d:ea0b with SMTP id ffacd0b85a97d-38bf566c314mr10592121f8f.25.1737389378224;
        Mon, 20 Jan 2025 08:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7jMmKmijGDhYJpj3v2AzDeWwh7lxfHaye7x+JEw9SklvyOVZq+Wb4Niy5wxwqRIeZEeA2rg==
X-Received: by 2002:adf:f682:0:b0:38b:e26d:ea0b with SMTP id ffacd0b85a97d-38bf566c314mr10592030f8f.25.1737389377661;
        Mon, 20 Jan 2025 08:09:37 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10695813f8f.26.2025.01.20.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:09:37 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, Jann Horn <jannh@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
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
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Kees Cook <kees@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Shuah
 Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Mike
 Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, Nicolas Saenz
 Julienne <nsaenzju@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, Luis
 Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
In-Reply-To: <Z44wSJTXknQVKWb0@pc636>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z4qBMqcMg16p57av@pc636>
 <xhsmhwmetfk9d.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z44wSJTXknQVKWb0@pc636>
Date: Mon, 20 Jan 2025 17:09:34 +0100
Message-ID: <xhsmhr04xfow1.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HwJfU-SXFxIM2vo-MT5pyZB1IhZkwtui28iMwRGblMM_1737389378
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_080942_660147_330F8F78 
X-CRM114-Status: GOOD (  31.12  )
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

T24gMjAvMDEvMjUgMTI6MTUsIFVsYWR6aXNsYXUgUmV6a2kgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MTcsIDIwMjUgYXQgMDY6MDA6MzBQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIHdyb3RlOgo+
PiBPbiAxNy8wMS8yNSAxNzoxMSwgVWxhZHppc2xhdSBSZXpraSB3cm90ZToKPj4gPiBPbiBGcmks
IEphbiAxNywgMjAyNSBhdCAwNDoyNTo0NVBNICswMTAwLCBWYWxlbnRpbiBTY2huZWlkZXIgd3Jv
dGU6Cj4+ID4+IE9uIDE0LzAxLzI1IDE5OjE2LCBKYW5uIEhvcm4gd3JvdGU6Cj4+ID4+ID4gT24g
VHVlLCBKYW4gMTQsIDIwMjUgYXQgNjo1MeKAr1BNIFZhbGVudGluIFNjaG5laWRlciA8dnNjaG5l
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4+ID4+ID4+IHZ1bm1hcCgpJ3MgaXNzdWVkIGZyb20gaG91
c2VrZWVwaW5nIENQVXMgYXJlIGEgcmVsYXRpdmVseSBjb21tb24gc291cmNlIG9mCj4+ID4+ID4+
IGludGVyZmVyZW5jZSBmb3IgaXNvbGF0ZWQgTk9IWl9GVUxMIENQVXMsIGFzIHRoZXkgYXJlIGhp
dCBieSB0aGUKPj4gPj4gPj4gZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSgpIElQSXMuCj4+ID4+ID4+
Cj4+ID4+ID4+IEdpdmVuIHRoYXQgQ1BVcyBleGVjdXRpbmcgaW4gdXNlcnNwYWNlIGRvIG5vdCBh
Y2Nlc3MgZGF0YSBpbiB0aGUgdm1hbGxvYwo+PiA+PiA+PiByYW5nZSwgdGhlc2UgSVBJcyBjb3Vs
ZCBiZSBkZWZlcnJlZCB1bnRpbCB0aGVpciBuZXh0IGtlcm5lbCBlbnRyeS4KPj4gPj4gPj4KPj4g
Pj4gPj4gRGVmZXJyYWwgdnMgZWFybHkgZW50cnkgZGFuZ2VyIHpvbmUKPj4gPj4gPj4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4gPj4gPj4KPj4gPj4gPj4gVGhpcyByZXF1
aXJlcyBhIGd1YXJhbnRlZSB0aGF0IG5vdGhpbmcgaW4gdGhlIHZtYWxsb2MgcmFuZ2UgY2FuIGJl
IHZ1bm1hcCdkCj4+ID4+ID4+IGFuZCB0aGVuIGFjY2Vzc2VkIGluIGVhcmx5IGVudHJ5IGNvZGUu
Cj4+ID4+ID4KPj4gPj4gPiBJbiBvdGhlciB3b3JkcywgaXQgbmVlZHMgYSBndWFyYW50ZWUgdGhh
dCBubyB2bWFsbG9jIGFsbG9jYXRpb25zIHRoYXQKPj4gPj4gPiBoYXZlIGJlZW4gY3JlYXRlZCBp
biB0aGUgdm1hbGxvYyByZWdpb24gd2hpbGUgdGhlIENQVSB3YXMgaWRsZSBjYW4KPj4gPj4gPiB0
aGVuIGJlIGFjY2Vzc2VkIGR1cmluZyBlYXJseSBlbnRyeSwgcmlnaHQ/Cj4+ID4+Cj4+ID4+IEkn
bSBub3Qgc3VyZSBpZiB0aGF0IHdvdWxkIGJlIGEgcHJvYmxlbSAobm90IGFuIG1tIGV4cGVydCwg
cGxlYXNlIGRvCj4+ID4+IGNvcnJlY3QgbWUpIC0gbG9va2luZyBhdCB2bWFwX3BhZ2VzX3Jhbmdl
KCksIGZsdXNoX2NhY2hlX3ZtYXAoKSBpc24ndAo+PiA+PiBkZWZlcnJlZCBhbnl3YXkuCj4+ID4+
Cj4+ID4+IFNvIGFmdGVyIHZtYXBwaW5nIHNvbWV0aGluZywgSSB3b3VsZG4ndCBleHBlY3QgaXNv
bGF0ZWQgQ1BVcyB0byBoYXZlCj4+ID4+IGludmFsaWQgVExCIGVudHJpZXMgZm9yIHRoZSBuZXds
eSB2bWFwcGVkIHBhZ2UuCj4+ID4+Cj4+ID4+IEhvd2V2ZXIsIHVwb24gdnVubWFwJ2luZyBzb21l
dGhpbmcsIHRoZSBUTEIgZmx1c2ggaXMgZGVmZXJyZWQsIGFuZCB0aHVzCj4+ID4+IHN0YWxlIFRM
QiBlbnRyaWVzIGNhbiBhbmQgd2lsbCByZW1haW4gb24gaXNvbGF0ZWQgQ1BVcywgdXAgdW50aWwg
dGhleQo+PiA+PiBleGVjdXRlIHRoZSBkZWZlcnJlZCBmbHVzaCB0aGVtc2VsdmVzIChJT1cgZm9y
IHRoZSBlbnRpcmUgZHVyYXRpb24gb2YgdGhlCj4+ID4+ICJkYW5nZXIgem9uZSIpLgo+PiA+Pgo+
PiA+PiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KPj4gPj4KPj4gPiBQcm9iYWJseSBpIGFtIG1pc3Np
bmcgc29tZXRoaW5nIGFuZCBuZWVkIHRvIGhhdmUgYSBsb29rIGF0IHlvdXIgcGF0Y2hlcywKPj4g
PiBidXQgaG93IGRvIHlvdSBndWFyYW50ZWUgdGhhdCBuby1vbmUgbWFwIHNhbWUgYXJlIHRoYXQg
eW91IGRlZmVyIGZvciBUTEIKPj4gPiBmbHVzaGluZz8KPj4gPgo+Pgo+PiBUaGF0J3MgdGhlIGNv
b2wgcGFydDogSSBkb24ndCA6JykKPj4KPiBJbmRlZWQsIHNvdW5kcyB1bnNhZmUgOikgVGhlbiB3
ZSBqdXN0IGRvIG5vdCBuZWVkIHRvIGZyZWUgYXJlYXMuCj4KPj4gRm9yIGRlZmVycmluZyBpbnN0
cnVjdGlvbiBwYXRjaGluZyBJUElzLCBJICh3ZWxsIEpvc2ggcmVhbGx5KSBtYW5hZ2VkIHRvCj4+
IGdldCBpbnN0cnVtZW50YXRpb24gdG8gYmFjayBtZSB1cCBhbmQgY2F0Y2ggYW55IHByb2JsZW1h
dGljIGFyZWEuCj4+Cj4+IEkgbG9va2VkIGludG8gZ2V0dGluZyBzb21ldGhpbmcgc2ltaWxhciBm
b3Igdm1hbGxvYyByZWdpb24gYWNjZXNzIGluCj4+IC5ub2luc3RyIGNvZGUsIGJ1dCBJIGRpZG4n
dCBnZXQgYW55d2hlcmUuIEkgZXZlbiB0cmllZCB1c2luZyBlbXVsYXRlZAo+PiB3YXRjaHBvaW50
cyBvbiBRRU1VIHRvIHdhdGNoIHRoZSB3aG9sZSB2bWFsbG9jIHJhbmdlLCBidXQgdGhhdCB3ZW50
IGFib3V0Cj4+IGFzIHdlbGwgYXMgeW91IGNvdWxkIGV4cGVjdC4KPj4KPj4gVGhhdCBsZWZ0IG1l
IHdpdGggc3RhcmluZyBhdCBjb2RlLiBBRkFJQ1QgdGhlIG9ubHkgdm1hcCdkIHRoaW5nIHRoYXQg
aXMKPj4gYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5IGlzIHRoZSB0YXNrIHN0YWNrIChDT05G
SUdfVk1BUF9TVEFDSyksIHdoaWNoCj4+IGl0c2VsZiBjYW5ub3QgYmUgZnJlZWQgdW50aWwgdGhl
IHRhc2sgZXhpdHMgLSB0aHVzIGNhbid0IGJlIHN1YmplY3QgdG8KPj4gaW52YWxpZGF0aW9uIHdo
ZW4gYSB0YXNrIGlzIGVudGVyaW5nIGtlcm5lbHNwYWNlLgo+Pgo+PiBJZiB5b3UgaGF2ZSBhbnkg
dHJhY2luZy9pbnN0cnVtZW50YXRpb24gc3VnZ2VzdGlvbnMsIEknbSBhbGwgZWFycyAoZXllcz8p
Lgo+Pgo+IEFzIG5vdGVkIGJlZm9yZSwgd2UgZGVmZXIgZmx1c2hpbmcgZm9yIHZtYWxsb2MuIFdl
IGhhdmUgYSBsYXp5LXRocmVzaG9sZAo+IHdoaWNoIGNhbiBiZSBleHBvc2VkKGlmIHlvdSBuZWVk
IGl0KSBvdmVyIHN5c2ZzIGZvciB0dW5pbmcuIFNvLCB3ZSBjYW4gYWRkIGl0Lgo+CgpJbiBhIENQ
VSBpc29sYXRpb24gLyBOT0haX0ZVTEwgY29udGV4dCwgaXNvbGF0ZWQgQ1BVcyB3aWxsIGJlIHJ1
bm5pbmcgYQpzaW5nbGUgdXNlcnNwYWNlIGFwcGxpY2F0aW9uIHRoYXQgd2lsbCBuZXZlciBlbnRl
ciB0aGUga2VybmVsLCB1bmxlc3MKZm9yY2VkIHRvIGJ5IHNvbWUgaW50ZXJmZXJlbmNlIChlLmcu
IElQSSBzZW50IGZyb20gYSBob3VzZWtlZXBpbmcgQ1BVKS4KCkluY3JlYXNpbmcgdGhlIGxhenkg
dGhyZXNob2xkIHdvdWxkIHVuZm9ydHVuYXRlbHkgb25seSBkZWxheSB0aGUKaW50ZXJmZXJlbmNl
IC0gaG91c2VrZWVwaW5nIENQVXMgYXJlIGZyZWUgdG8gcnVuIHdoYXRldmVyLCBhbmQgc28gdGhl
eSB3aWxsCmV2ZW50dWFsbHkgY2F1c2UgdGhlIGxhenkgdGhyZXNob2xkIHRvIGJlIGhpdCBhbmQg
SVBJIGFsbCB0aGUgQ1BVcywKaW5jbHVkaW5nIHRoZSBpc29sYXRlZC9OT0haX0ZVTEwgb25lcy4K
Ckkgd2FzIHRoaW5raW5nIG1heWJlIHdlIGNvdWxkIHN1YmRpdmlkZSB0aGUgdm1hcCBzcGFjZSBp
bnRvIHR3byByZWdpb25zCndpdGggdGhlaXIgb3duIHRocmVzaG9sZHMsIGJ1dCBhIHRhc2sgbWF5
IGFsbG9jYXRlL3ZtYXAgc3R1ZmYgd2hpbGUgb24gYSBISwpDUFUgYW5kIGJlIG1vdmVkIHRvIGFu
IGlzb2xhdGVkIENQVSBhZnRlcndhcmRzLCBhbmQgYWxzbyBJIHN0aWxsIGRvbid0IGhhdmUKYW55
IHN0cm9uZyBndWFyYW50ZWUgYWJvdXQgd2hhdCBhY2Nlc3NlcyBhbiBpc29sYXRlZCBDUFUgY2Fu
IGRvIGluIGl0cwplYXJseSBlbnRyeSBjb2RlIDooCgo+IC0tCj4gVWxhZHppc2xhdSBSZXpraQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
