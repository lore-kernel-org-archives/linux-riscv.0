Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D319DC0219B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaUchf3d5Vcx6KhPoR+YyLm6zp8wH5MpVB7yHsV4TNA=; b=IIy60/mjQJ77nt
	DbAI4GSyeMmFF0u01jqDpQwx84Q0qG0XdM2H5uM/K25LAgn8QYSuULSpfsN8bJlrU4r09gjw+4ZDo
	6TUDyCcRiDQIBkCfi64kTyoysd4MSka/teLOgfENPxqAnKxMPIy8zgEvPsW+T2LS/AMp6UTUbBuR6
	ce/VCGuSxkR8NUwvhoObCj5mdLWCpl0FGIEvHDNR1bqBCkR65DRltQ1ZhOjhM5RDP4ZLoihYATKlZ
	OwHRLQDvmWiNiD367eKa4D/bivPJP9KYJLMfxjMr+/e8NhekI6t0b2rAig/2mOYxyjsdZlAAgrc9d
	EPloN8bLi2kDqM6ZRSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXsA-00000000mZW-1QUU;
	Mon, 10 Feb 2025 17:47:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXhz-00000000kjM-2aur
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 17:36:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=; b=Y8xSZmTlRhLi8luhI3bdYnhEyW
	zXwDgawTqtaybA47CWJyL57CCW3UUfC/A3JUZsjLHGtK4kPqulls0YN8q/RuquCTXJyzhgrWcia19
	ajKXybV3uvasJCwqnTu8/IKfK1AUZkt3Tps83rspcD9wxPN3jKYrc9TRHPHuzq8xdzq/kCdpH4Ifo
	cos+c8S4MEWeol2Zm7rAVskqPAf5RLP/r8ay9Ti4uOxbxHSN1oG2NYSx85m5EkzHtBD6onF8uT21W
	aaNQa5Q/JWYhAgVH6fKGUYdEBrFvkhl62zpFphvACpyh//LG25tVGyGPrvzKpBff1Vd2e7k7WeQ5b
	tGGN/YTg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXhw-00000000Bb8-1Ie6
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 17:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739208988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=;
	b=TNVef/C9tVl7GrjDDWrrk4hKqiVtvBdY+TNx20ou+2MVywJjBiuRS+LAdusTTRCqabnRrS
	2SiqpNifaNfl25SlyrgBFL3GpF+iEYwRuIyGr0R8M3DIJp2CSXAawX3L6JXmi/qYw5Lo2e
	q6z9McKvrk7zmUsoFCctS6WLdDv4p8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739208988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=;
	b=TNVef/C9tVl7GrjDDWrrk4hKqiVtvBdY+TNx20ou+2MVywJjBiuRS+LAdusTTRCqabnRrS
	2SiqpNifaNfl25SlyrgBFL3GpF+iEYwRuIyGr0R8M3DIJp2CSXAawX3L6JXmi/qYw5Lo2e
	q6z9McKvrk7zmUsoFCctS6WLdDv4p8Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-WCkFfRhAO4CJsJ05g0kIEw-1; Mon, 10 Feb 2025 12:36:26 -0500
X-MC-Unique: WCkFfRhAO4CJsJ05g0kIEw-1
X-Mimecast-MFC-AGG-ID: WCkFfRhAO4CJsJ05g0kIEw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dca55788eso1753084f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 09:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208985; x=1739813785;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmeQoovG0+h8NkGt8mJ7mUN4l2oR44byLjbsSTWDllc=;
        b=uySzA4vv9+Q9/NETFZjzdifmQMK/b4rv31bXvw7QQreySBR6y+FPJ2HLRAarKFUSrR
         rBFErR2moQ5x0bJ+BDif3ux0j7MA5EIZ12dApqfIW7kN7KwNf9eFtLlAXMEcQBmky+/9
         RwCTKDlhT4MB3aLFLM7P6Ucna3zwSB5GzV04qaAJGwfoi05nNS2o7GhjPV3DmQk4AxIE
         lS9HQUjbNxnjdZV1b7YnPxM3R9jkcGk9EhP2Nlo75jHtdVKmF6FURA3M/CuEegSRv7ds
         b1NmlLeZWIoM2Dg14WQvv1vFjoY64Np+Oyno8LCO84b2PjRKpvEVQU/uB0hxJLlhG/ji
         uwXw==
X-Forwarded-Encrypted: i=1; AJvYcCX7aMF5hO3eMSaLepkie35PYWFjDtDYdassZ9zmMGLFF5WODtlLmsGpxYle/pgRSXe3J+OXo56lQwwTpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/8Nw2caLuTp2W4DPhL9r8UHDRc/g4uIy6TILUFmJTjnTW4gPe
	Vs5WswbzDQwxVcjeOi5KEXw23ypOcciwLLcLDOvrl7Ud6KQIogfH8ZhCbTd03avbUS3jbljjI27
	MOc+ZR1GI+VeVBMtTX2WZ/+e0kbR6ZFnXmpZrzakRC54JmQJXcv2RiNRoMo8EIr6mKQ==
X-Gm-Gg: ASbGncuQt6QLbC2crL78Rke2Qv9QTcz+vduAi+0AKaN5QBsAlD/C/8tDj93c62SyO1t
	1evfrn0Q+QqUreJTqhBf83WAGPJCJEZg8keXpo28RZnNJ1eY/2O48blUBFYxSdmHYvqY+1PL2y7
	AiTdITS+qNI3E65autfzCh+BvslpV/idQaZc2ZeHmJi5lWCMYJB42D+xDb6xm1yOjjDAx2cQrx7
	meRta/t8mkGrjlZLKd5nYD+fXouMf7GHqAT1WmSUPpOJUQEUqU+CiNXi8kvouZRhYF1gl3TJfJm
	ycRsJ/AndsS2XISfPqC2epDd8xBlTvtNJCtkbhHzKCcQoYUCM4I8JJ0BnIes54qzLQ==
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d953 with SMTP id ffacd0b85a97d-38de250dbabmr3058680f8f.35.1739208985422;
        Mon, 10 Feb 2025 09:36:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxfTkrMg3Ut4KvVNhGVu91A0XAdGHvAD9T0QbpHzfP2OmSPgOw5f7LxHQ3fWHxL8NqTxJ5mQ==
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d953 with SMTP id ffacd0b85a97d-38de250dbabmr3058583f8f.35.1739208984820;
        Mon, 10 Feb 2025 09:36:24 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm12687106f8f.53.2025.02.10.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:36:24 -0800 (PST)
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
In-Reply-To: <Z6ZTBXUiEOLVcSKp@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
 <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Z6ZTBXUiEOLVcSKp@pavilion.home>
Date: Mon, 10 Feb 2025 18:36:20 +0100
Message-ID: <xhsmh8qqdk8h7.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbd0E2qQKNKVjTf2xA1Zb8OrGVV9VevV_4EVRTUYwik_1739208985
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_173632_633404_6E389D6E 
X-CRM114-Status: GOOD (  13.75  )
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

T24gMDcvMDIvMjUgMTk6MzcsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgRnJpLCBG
ZWIgMDcsIDIwMjUgYXQgMDY6MDY6NDVQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4KPj4gU29vb28gSSd2ZSBiZWVuIHRoaW5raW5nLi4uCj4+Cj4+IElzbid0Cj4+Cj4+
ICAgKGNvbnRleHRfdHJhY2tpbmcuc3RhdGUgJiBDVF9SQ1VfV0FUQ0hJTkcpCj4+Cj4+IHByZXR0
eSBtdWNoIGEgcHJveHkgZm9yIGtub3dpbmcgd2hldGhlciBhIENQVSBpcyBleGVjdXRpbmcgaW4g
a2VybmVsc3BhY2UsCj4+IGluY2x1ZGluZyBOTUlzPwo+Cj4gWW91IGdvdCBpdCEKPgoKWWF5IQoK
Pj4KPj4gTk1JIGludGVycnVwdHMgdXNlcnNwYWNlL1ZNL2lkbGUgLT4gY3Rfbm1pX2VudGVyKCkg
ICAtPiBpdCBiZWNvbWVzIHRydWUKPj4gSVJRIGludGVycnVwdHMgaWRsZSAgICAgICAgICAgICAg
LT4gY3RfaXJxX2VudGVyKCkgICAtPiBpdCBiZWNvbWVzIHRydWUKPj4gSVJRIGludGVycnVwdHMg
dXNlcnNwYWNlICAgICAgICAgLT4gX19jdF91c2VyX2V4aXQoKSAtPiBpdCBiZWNvbWVzIHRydWUK
Pj4gSVJRIGludGVycnVwdHMgVk0gICAgICAgICAgICAgICAgLT4gX19jdF91c2VyX2V4aXQoKSAt
PiBpdCBiZWNvbWVzIHRydWUKPj4KPj4gSU9XLCBpZiBJIGdhdGUgc2V0dGluZyBkZWZlcnJlZCB3
b3JrIGJ5IGNoZWNraW5nIGZvciB0aGlzIGluc3RlYWQgb2YKPj4gZXhwbGljaXRlbHkgQ1RfU1RB
VEVfS0VSTkVMLCAiaXQgc2hvdWxkIHdvcmsiIGFuZCBwcmV2ZW50IHRoZQo+PiBhZm9yZW1lbnRp
b25lZCBpc3N1ZT8gT3Igc2hvdWxkIEkgYmUgb3V0IGRyaW5raW5nIGluc3RlYWQ/IDotKQo+Cj4g
RXhhY3RseSBpdCBzaG91bGQgd29yayEgTm93IHRoYXQgZG9lc24ndCBtZWFuIHlvdSBjYW4ndCBn
byBvdXQKPiBmb3IgYSBkcmluayA6LSkKPgoKV2VsbCwgZHJpbmtzIHdlcmUgaGFkIHZlcnkgc2hv
cnRseSBhZnRlciBzZW5kaW5nIHRoaXMgZW1haWwgOkQKCj4gVGhhbmtzLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
