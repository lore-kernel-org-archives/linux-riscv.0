Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF02C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qiGHWqoOUsOV5ajFLL+XqZcI7aKRmZwvuZJetNWbLjo=; b=TyPhGxr4bVt9ZB
	4Eu1k95gCOxuT1VfyrJAHd21jcV+A42kAli+IhGK0S49frRvfqz8urYq6RKSDtuWqsIDycKwX7P3J
	uaqlutIJ/h6vC1Larkwisn2nrasaWLY/N3S/n4zju5YPF9zi87HDw7io4UadgvLolujj8Aq3aMNRj
	IVhFuzAS8JAlCbuEyJ/Trlgip//X/swGfaE8T09+ynA3aqZHopelvAEBlNlZAFMUJ+jzWoRoXCC/1
	a3Op/OkuWUd82v7boFNF3Hd1a//OeKQ/zqiN9CnGO28YGRT6t9lDuRr779Y9CVFjQgt0jpsNGhx8k
	rApgZKhT3Ibqy94FQUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymFI-0000000C7kz-1eD3;
	Mon, 22 Apr 2024 05:29:40 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymFG-0000000C7jV-3G0k
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:29:40 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-36a0f64f5e0so16629265ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713763776; x=1714368576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u4byTUlDNwKD7I4IoEN6osZEpNF6BpvONGOZchupOs=;
        b=WuByI3E6kVnyClVknorpc3WG8fueom192w07xKMbiHubUDOTpoS2HhTF1ykbrmNWMz
         fUWpn/SRxSRNhDRoGJG9m6LR+ff8moZJb4pbtw2Dk0PPbyFMgM3A8DFXRXUQ/jdnDgQy
         EIVbbvSN1JGbEsjP9eJdyDTWNiLmR7N/YtD74kkI1rRyGjAWM6fq485VHgdWptqQfjcx
         el+lVyoGRg4XMz6pFGcQsa5HTau6CrtwcsFpm1PGKtT9KRmfKIWdB0SjL2lhdqid4NR4
         +G8h4Nu1lhey8FWgDW/ytcHm1EYts+K8uR+au4gR8DlElcliyOE4V896ZjUssvTNpjV2
         SRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713763776; x=1714368576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u4byTUlDNwKD7I4IoEN6osZEpNF6BpvONGOZchupOs=;
        b=mkd7u4AVyKHd97NKPxX0JtG7HaHhomXp5DaTB6SqJvfFBHsP/vyoLLnnxMHLlk24WB
         ZKKsveWgqikE+qJ0mhyyQaYfHiULEMufBCMILmfXQAyAmZ4a0EXH4Uy5PvbX0e0En7Eq
         a5+ZevrI4040Am59WltAL0ZaZBZW/mE+OXNyoRn9O6DtrEQ1wIxqAbbh6ppv0dmrkm8D
         BK+eORM24aE68Ozq8YRYhgrOPaLqsEpUPk947dNdb71FCaH6+QTcObVp7eiTO71ITjEJ
         4zawhfZGTtz7yzHXFIhVw51pF9TOR3yf/DI5/VbhWUFjsD31yJfg2auhOCQZ/cSYFoyE
         Pmtg==
X-Forwarded-Encrypted: i=1; AJvYcCX/i0N6Jtat+Irn4V7AT+/9W+svgHl2M3TJ5EWHznaj3yDhOWZsU4RaQSUwiJEjtFVF1G+TrGDnMU7hqDli6PasVp5PD3Fg1PakUDtrZeqR
X-Gm-Message-State: AOJu0Yy/GRCJUdmVWfi+UEEzet6lRGWBDjMBfzunZugn7+3ojpNjItQy
	9BXTP6WVXjwEgTsqOybGfu8c82NiMefq7KtE3KkTxUMYplKxCUbIYTCrWDxf2LETKsK2ufOpS42
	5bvEgToHByLlmymZE70NnzMR4aRbyJWfYhq3esA==
X-Google-Smtp-Source: AGHT+IFC/ggrORFQDRIsgf3m5CDc64LQxhFUDaRtJHNN1AtIkubwk7+EwLTGLb3mIW99QlL7g0zTkCXH/qKaaakQzOk=
X-Received: by 2002:a92:cd89:0:b0:36a:fa7a:629f with SMTP id
 r9-20020a92cd89000000b0036afa7a629fmr13121951ilb.21.1713763776638; Sun, 21
 Apr 2024 22:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-19-atishp@rivosinc.com>
In-Reply-To: <20240420151741.962500-19-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:59:25 +0530
Message-ID: <CAAhSdy0OmAjs1oHUjPzwUydsnGtqUd_HKTZKZzJpQQFEXvPX8w@mail.gmail.com>
Subject: Re: [PATCH v8 18/24] KVM: riscv: selftests: Add helper functions for
 extension checks
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_222938_839073_DC6A5A90 
X-CRM114-Status: GOOD (  17.42  )
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

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IF9fdmNwdV9oYXNfZXh0IGNhbiBjaGVjayBib3RoIFNCSSBh
bmQgSVNBIGV4dGVuc2lvbnMgd2hlbiB0aGUgZmlyc3QKPiBhcmd1bWVudCBpcyBwcm9wZXJseSBj
b252ZXJ0ZWQgdG8gU0JJL0lTQSBleHRlbnNpb24gSURzLiBJbnRyb2R1Y2UKPiB0d28gaGVscGVy
IGZ1bmN0aW9ucyB0byBtYWtlIGxpZmUgZWFzaWVyIGZvciBkZXZlbG9wZXJzIHNvIHRoZXkKPiBk
b24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IHRoZSBjb252ZXJzaW9ucy4KPgo+IFJlcGxhY2UgdGhl
IGN1cnJlbnQgdXNhZ2VzIGFzIHdlbGwgd2l0aCBuZXcgaGVscGVycy4KPgo+IFJldmlld2VkLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCAx
MCArKysrKysrKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3Rp
bWVyLmMgICAgICAgIHwgIDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IGluZGV4IDNiOWNiMzkzMjdmZi4uNWYzODkx
NjYzMzhjIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3Jpc2N2L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2lu
Y2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBAQCAtNTAsNiArNTAsMTYgQEAgc3RhdGljIGlubGlu
ZSB1aW50NjRfdCBfX2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3Qgc3VidHlwZSwK
Pgo+ICBib29sIF9fdmNwdV9oYXNfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWludDY0X3Qg
ZXh0KTsKPgo+ICtzdGF0aWMgaW5saW5lIGJvb2wgX192Y3B1X2hhc19pc2FfZXh0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgdWludDY0X3QgaXNhX2V4dCkKPiArewo+ICsgICAgICAgcmV0dXJuIF9f
dmNwdV9oYXNfZXh0KHZjcHUsIFJJU0NWX0lTQV9FWFRfUkVHKGlzYV9leHQpKTsKPiArfQo+ICsK
PiArc3RhdGljIGlubGluZSBib29sIF9fdmNwdV9oYXNfc2JpX2V4dChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHVpbnQ2NF90IHNiaV9leHQpCj4gK3sKPiArICAgICAgIHJldHVybiBfX3ZjcHVfaGFz
X2V4dCh2Y3B1LCBSSVNDVl9TQklfRVhUX1JFRyhzYmlfZXh0KSk7Cj4gK30KPiArCj4gIHN0cnVj
dCBleF9yZWdzIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmE7Cj4gICAgICAgICB1bnNpZ25l
ZCBsb25nIHNwOwo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3YvYXJjaF90aW1lci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hf
dGltZXIuYwo+IGluZGV4IDBmOWNhYmQ5OWZkNC4uNzM1Yjc4NTY5MDIxIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMKPiArKysgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4gQEAgLTg1LDcg
Kzg1LDcgQEAgc3RydWN0IGt2bV92bSAqdGVzdF92bV9jcmVhdGUodm9pZCkKPiAgICAgICAgIGlu
dCBucl92Y3B1cyA9IHRlc3RfYXJncy5ucl92Y3B1czsKPgo+ICAgICAgICAgdm0gPSB2bV9jcmVh
dGVfd2l0aF92Y3B1cyhucl92Y3B1cywgZ3Vlc3RfY29kZSwgdmNwdXMpOwo+IC0gICAgICAgX19U
RVNUX1JFUVVJUkUoX192Y3B1X2hhc19leHQodmNwdXNbMF0sIFJJU0NWX0lTQV9FWFRfUkVHKEtW
TV9SSVNDVl9JU0FfRVhUX1NTVEMpKSwKPiArICAgICAgIF9fVEVTVF9SRVFVSVJFKF9fdmNwdV9o
YXNfaXNhX2V4dCh2Y3B1c1swXSwgS1ZNX1JJU0NWX0lTQV9FWFRfU1NUQyksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiU1NUQyBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0
ZXN0XG4iKTsKPgo+ICAgICAgICAgdm1faW5pdF92ZWN0b3JfdGFibGVzKHZtKTsKPiAtLQo+IDIu
MzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
