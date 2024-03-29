Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF32CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsTtED3DysJRCKwcJx+QCwnXVbxHhSKWy4wDqai9HGc=; b=jy9RNfahUf8AHe
	BluCFIHTURP5glIAaaTSEBrf4qUiXFreT8JJIyYFeOKyJnNo8EY7pLQkrgxKZ9aJse1w8MyWPxvzW
	HGFg3BxaTN2zw3h1EkFEBInFWrWKhhmhLwl/omgcJeLlbVpXmjTL/zNN51ZrJlOgyzpuFOZDh6Ezw
	J8U5PobpM9VYSQdiYrVaBz9RCJNhkL4u7vhJmJPnykyrzGNWsew+0vxd+XSw8NNFKQSo3HfWkNVtE
	WRo+36U6uNixSqbskDSri9nIt+WBYZYT33JVz+Jp8eR++2e0Wt4etksOLPF0lTS/Z5+6TrKPTVmyX
	BP9YuRkoGnOBU4BkPTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIQd-00000001qqe-0NbV;
	Fri, 29 Mar 2024 20:02:19 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqIQZ-00000001qpl-3MA8
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 20:02:17 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-611639a0e4eso20881177b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711742534; x=1712347334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t40h4ZVVyU3YcHuS3ADegeoOz9PnpHCj92mWxUgwXKE=;
        b=GbEh3XQ4Cug7j/BHndaA0mVhp6TAb0+8Uy6xQ8XYHlk0g1pDxQK3KliaLlb88cYT/j
         Km+519wGCEsyHM5HYDme90ol/YT4+u4q2AB7x/7C6O7xw5PcPFc4vF4855E/B5kWBHxa
         dt+fQrDirhcK/aQCX/ysx1Ly1T5Miap31vpuzSvYj6wMOoJInvTUnuCMLOk7HmPZ3AM5
         7t1dxiAl6gPCgFhxBwOZcaXzEldyC2sYVisy1o4641oi0g4k7ZUxewL2T3eLWRPI72CQ
         eUJzOEQMyRkCvOSJoqbJYDQ8d+BLvsyISTq0VUYOhhhVZuWAB1lDxH9EPhXxI0GPMgXS
         rzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711742534; x=1712347334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t40h4ZVVyU3YcHuS3ADegeoOz9PnpHCj92mWxUgwXKE=;
        b=B5/mW05qppKrVZWefHRljcd7g5RChC0G5TC/2H3AYbM4KCp2ocuEWDaTvf73ILCcdz
         LGKqXtptl3/YuQ0EuT1Amgo6KTVLHap6nmueAQglB0pSqs9wgA3S/MVKsKeCP+8vOUUc
         2zH9HSIA9oHgXsDEHjSN+4PTsIgEXo3DWEuUtaqD6RpX+bWbQrJKibnDMjchekPv+rk5
         dXGk8lT6UaTZmos4mBZt5QIgW5eQpCSDGlF3En7oBr3hO0EiiJ56of3Ol/Skq2Usw9Ao
         CeTDWblHQ63ay6XB4LJJ1dS6cRdIj7K5GoPwSNkvycqtx2vadnmVLcP72J2QpxbRVl9K
         LXPg==
X-Forwarded-Encrypted: i=1; AJvYcCWHeg/Dm6eWmjIz0EYjD1nPoBo/RTXPXwRcpow1PZ8zp/x5CauLeCsA6PerpVxUXl6Vh1FJFLWZDWcxEjnFkNg+8EDITZWOI0qgHIOpzTJ9
X-Gm-Message-State: AOJu0YzjIbiNvMzYIO8Rg/sIDhfZAyMj8c9sLjpE85Ts2J1o4qwDbPrA
	WHdWWs87FP6wgNYNC2xn3ylrz5d8U4njyAl4GNvkAxDSbUbFLyneMKI7So8e0xKlaOLX3/miLXS
	DFitGapgWBKryNG/wM1E3JFuWhiZ4Lou74smqRO6+JdM1EkVfINKZgA==
X-Google-Smtp-Source: AGHT+IGtnKg+yyXhs907Pora7J+RzD45KJQ+UfSqQQ1XkC5eECGLQ66rb6PRiDq9m4/5ND7CCb26prI4BwPY/uB5eaA=
X-Received: by 2002:a25:f912:0:b0:dc7:494e:ff33 with SMTP id
 q18-20020a25f912000000b00dc7494eff33mr2270811ybe.7.1711742534274; Fri, 29 Mar
 2024 13:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044459.3990638-1-debug@rivosinc.com> <20240329044459.3990638-28-debug@rivosinc.com>
 <4b38393a-f69d-4a77-a896-b6cd42c7edcf@collabora.com>
In-Reply-To: <4b38393a-f69d-4a77-a896-b6cd42c7edcf@collabora.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 29 Mar 2024 13:02:03 -0700
Message-ID: <CAKC1njQ_RU=uHhrna=MFVdjAMjjQNqZWnkjPoJvO7CxtPMeNuQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/27] kselftest/riscv: kselftest for user mode cfi
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com, broonie@kernel.org, 
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org, 
	ajones@ventanamicro.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, palmer@sifive.com, 
	conor@kernel.org, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, corbet@lwn.net, 
	tech-j-ext@lists.risc-v.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com, 
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com, shuah@kernel.org, 
	brauner@kernel.org, andy.chiu@sifive.com, jerry.shih@sifive.com, 
	hankuan.chen@sifive.com, greentime.hu@sifive.com, evan@rivosinc.com, 
	xiao.w.wang@intel.com, charlie@rivosinc.com, apatel@ventanamicro.com, 
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com, sameo@rivosinc.com, 
	shikemeng@huaweicloud.com, willy@infradead.org, vincent.chen@sifive.com, 
	guoren@kernel.org, samitolvanen@google.com, songshuaishuai@tinylab.org, 
	gerg@kernel.org, heiko@sntech.de, bhe@redhat.com, 
	jeeheng.sia@starfivetech.com, cyy@cyyself.name, maskray@google.com, 
	ancientmodern4@gmail.com, mathis.salmen@matsal.de, cuiyunhui@bytedance.com, 
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, 
	david@redhat.com, catalin.marinas@arm.com, revest@chromium.org, 
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, 
	ojeda@kernel.org, jhubbard@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_130215_978547_6E5FC7CD 
X-CRM114-Status: GOOD (  16.54  )
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

T24gRnJpLCBNYXIgMjksIDIwMjQgYXQgMTI6NTDigK9QTSBNdWhhbW1hZCBVc2FtYSBBbmp1bQo8
dXNhbWEuYW5qdW1AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiAzLzI5LzI0IDk6NDQgQU0s
IERlZXBhayBHdXB0YSB3cm90ZToKPiA+IEFkZHMga3NlbGZ0ZXN0IGZvciBSSVNDLVYgY29udHJv
bCBmbG93IGludGVncml0eSBpbXBsZW1lbnRhdGlvbiBmb3IgdXNlcgo+ID4gbW9kZS4gVGhlcmUg
aXMgbm90IGEgbG90IGdvaW5nIG9uIGluIGtlcm5lbCBmb3IgZW5hYmxpbmcgbGFuZGluZyBwYWQg
Zm9yCj4gPiB1c2VyIG1vZGUuIFRodXMga3NlbGZ0ZXN0IHNpbXBseSBlbmFibGVzIGxhbmRpbmcg
cGFkIGZvciB0aGUgYmluYXJ5IGFuZAo+ID4gYSBzaWduYWwgaGFuZGxlciBpcyByZWdpc3RlcmVk
IGZvciBTSUdTRUdWLiBBbnkgY29udHJvbCBmbG93IHZpb2xhdGlvbiBhcmUKPiA+IHJlcG9ydGVk
IGFzIFNJR1NFR1Ygd2l0aCBzaV9jb2RlID0gU0VHVl9DUEVSUi4gVGVzdCB3aWxsIGZhaWwgb24g
cmVjaWV2aW5nCj4gPiBhbnkgU0VHVl9DUEVSUi4gU2hhZG93IHN0YWNrIHBhcnQgaGFzIG1vcmUg
Y2hhbmdlcyBpbiBrZXJuZWwgYW5kIHRodXMgdGhlcmUKPiA+IGFyZSBzZXBhcmF0ZSB0ZXN0cyBm
b3IgdGhhdAo+ID4gICAgICAgLSBlbmFibGUgYW5kIGRpc2FibGUKPiA+ICAgICAgIC0gRXhlcmNp
c2UgYG1hcF9zaGFkb3dfc3RhY2tgIHN5c2NhbGwKPiA+ICAgICAgIC0gYGZvcmtgIHRlc3QgdG8g
bWFrZSBzdXJlIENPVyB3b3JrcyBmb3Igc2hhZG93IHN0YWNrIHBhZ2VzCj4gPiAgICAgICAtIGd1
cCB0ZXN0cwo+ID4gICAgICAgICBBcyBvZiB0b2RheSBrZXJuZWwgdXNlcyBGT0xMX0ZPUkNFIHdo
ZW4gYWNjZXNzIGhhcHBlbnMgdG8gbWVtb3J5IHZpYQo+ID4gICAgICAgICAvcHJvYy88cGlkPi9t
ZW0uIE5vdCBicmVha2luZyB0aGF0IGZvciBzaGFkb3cgc3RhY2sKPiA+ICAgICAgIC0gc2lnbmFs
IHRlc3QuIE1ha2Ugc3VyZSBzaWduYWwgZGVsaXZlcnkgcmVzdWx0cyBpbiB0b2tlbiBjcmVhdGlv
biBvbgo+ID4gICAgICAgc2hhZG93IHN0YWNrIGFuZCBjb25zdW1lcyAoYW5kIHZlcmlmaWVzKSB0
b2tlbiBvbiBzaWdyZXR1cm4KPiA+ICAgICAtIHNoYWRvdyBzdGFjayBwcm90ZWN0aW9uIHRlc3Qu
IGF0dGVtcHRzIHRvIHdyaXRlIHVzaW5nIHJlZ3VsYXIgc3RvcmUKPiA+ICAgICAgICAgaW5zdHJ1
Y3Rpb24gb24gc2hhZG93IHN0YWNrIG1lbW9yeSBtdXN0IHJlc3VsdCBpbiBhY2Nlc3MgZmF1bHRz
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+
Cj4gPiAtLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9NYWtlZmlsZSAgICAg
ICAgfCAgIDIgKy0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvTWFrZWZp
bGUgICAgfCAgMTAgKwo+ID4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvY2ZpX3J2
X3Rlc3QuaCB8ICA4NSArKysrCj4gPiAgLi4uL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvcmlzY3ZfY2Zp
X3Rlc3QuYyAgICAgIHwgIDkxICsrKysrCj4gPiAgLi4uL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L2NmaS9zaGFkb3dzdGFjay5jIHwgMzc2ICsrKysrKysrKysrKysrKysrKwo+ID4gIC4uLi90ZXN0
aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hhZG93c3RhY2suaCB8ICAzOSArKwo+IFBsZWFzZSBh
ZGQgZ2VuZXJhdGVkIGJpbmFyaWVzIGluIHRoZSAuZ2l0aWdub3JlIGZpbGVzLgoKaG1tLi4uCkkg
ZG9uJ3Qgc2VlIGJpbmFyeSBhcyBwYXJ0IG9mIHRoZSBwYXRjaC4gV2hpY2ggZmlsZSBhcmUgeW91
IHJlZmVycmluZwp0byBoZXJlIGJlaW5nIGJpbmFyeT8KCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
