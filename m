Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFECEC02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlDlnc3XjfH89ZxUS3suu55zBlAl7bpMtptHy03f9xA=; b=tb1TWv/Gp1mR8c
	ZcntUdZdwhQS5//RSvFamA3+3O8cTDBFHa8aJ6pKZArwb/2phTg4MZYYtOwtqmSNn4YtVPWYhKsyU
	Uc43M/donYgv+rcx3LfONAid1m7hnymDbIyALt7/AiA8JT8Obl49CmIYFlq7TuCh/VmPshKdNxyGV
	/5N8GsZTqtpEC32IvXXkkv5AT/nHXGYqRlMHPZ5WuVmENkk/EvDZfFdchp4sUx3DZ+Fq3ctO/3z1q
	GudyiB7y7wiiLYQeE8WF3+fQxGy/a9jyhf2fGtQf0+GDlwvIrsqf9uaLyW6xAI9jXpd94UdrHcM48
	JqK3kt6H6VxUKgys05ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teySs-0000000Ft2r-3WAj;
	Mon, 03 Feb 2025 15:34:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teySR-0000000FsyF-3JuR
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 15:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E457A4149F;
	Mon,  3 Feb 2025 15:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9F6C4CED2;
	Mon,  3 Feb 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738596834;
	bh=1AMEL90TOYAiTq+wyZ9+Tqush4WsmqodawyJnoTLY5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=agTwQGhXyE39J4X2qXtC6qzQG0GXRcmfDq7EvYDSRIDLznwnvxI4aubVD0DpFhtSn
	 l7viQmzRItspd+UwHpdIllNI242e7TsPZRu6SVkwAgJJIPRpe5GEajdt+PB0EIHagb
	 P7iHxcitpmN5w/Z4iIIIZIFNZWqpvo+XitifKURkboN0yG2uCHxRBr2IUZgpoiZzqP
	 ZWKQfQJmUEO8VSthBJ2tpyzmzQaEo2Wzy7LdZSEv4teZDFh+2bJSBmk+NoDk0PaJsV
	 laHiei6F+JyPO2CQE3V+3AgjicN39CW1qhxRV/7qxrnikCW/M7iMF5T5tUKkYSis37
	 5mh20xK5N1suA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
References: <mvmfrkv2vhz.fsf@suse.de>
Date: Mon, 03 Feb 2025 16:33:50 +0100
Message-ID: <87jza7oxep.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_073355_892498_18D08FAD 
X-CRM114-Status: GOOD (  14.13  )
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

QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cml0ZXM6Cgo+IE1ha2Ugc3VyZSB0aGUg
Y29tcGFyZSB2YWx1ZSBpbiB0aGUgbHIvc2MgbG9vcCBpcyBzaWduIGV4dGVuZGVkIHRvIG1hdGNo
Cj4gd2hhdCBsci53IGRvZXMuICBGb3J0dW5hdGVseSwgZHVlIHRvIHRoZSBjb21waWxlciBrZWVw
aW5nIHRoZSByZWdpc3Rlcgo+IGNvbnRlbnRzIHNpZ24gZXh0ZW5kZWQgYW55d2F5IHRoZSBsYWNr
IG9mIHRoZSBleHBsaWNpdCBleHRlbnNpb24gZGlkbid0Cj4gcmVzdWx0IGluIHdyb25nIGNvZGUg
c28gZmFyLCBidXQgdGhpcyBjYW5ub3QgYmUgcmVsaWVkIHVwb24uCj4KPiBGaXhlczogYjkwZWRi
MzMwMTBiICgiUklTQy1WOiBBZGQgZnV0ZXggc3VwcG9ydC4iKQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4KCkhtbSwgaW4gdGhpcyBzY2VuYXJpbyB3ZSAq
Y2FuKiByZWx5IG9uIGl0LCBubyAoaW5saW5lIHZzIG1hY3JvKT8KClJlZ2FyZGxlc3MsIGhhdmlu
ZyBhbiBleHBsaWNpdCBjYXN0IHRoZXJlIGRvZXNuJ3QgaHVydCwgYW5kIG1ha2UgaXQgbW9yZQpv
YnZpb3VzIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
CkxldCdzIGFkZCBhIGxpbmsgdG8gSmVzc2ljYSdzIGNvbW1lbnQgYXMgd2VsbDoKTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0MyRDkyMjAtRjhERS00Q0M4LUFDQUQt
N0IxQTIxRTI3NkZFQGpydGMyNy5jb20vCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z1dGV4LmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaAo+IGluZGV4IGZjODEzMGY5OTVjMS4uNjkw
N2M0NTZhYzhjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnV0ZXguaAo+IEBAIC05Myw3ICs5Myw3IEBA
IGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKHUzMiAqdXZhbCwgdTMyIF9fdXNlciAqdWFk
ZHIsCj4gIAkJX0FTTV9FWFRBQkxFX1VBQ0NFU1NfRVJSKDFiLCAzYiwgJVtyXSkJXAo+ICAJCV9B
U01fRVhUQUJMRV9VQUNDRVNTX0VSUigyYiwgM2IsICVbcl0pCVwKPiAgCTogW3JdICIrciIgKHJl
dCksIFt2XSAiPSZyIiAodmFsKSwgW3VdICIrbSIgKCp1YWRkciksIFt0XSAiPSZyIiAodG1wKQo+
IC0JOiBbb3ZdICJKciIgKG9sZHZhbCksIFtudl0gIkpyIiAobmV3dmFsKQo+ICsJOiBbb3ZdICJK
ciIgKChsb25nKShpbnQpb2xkdmFsKSwgW252XSAiSnIiIChuZXd2YWwpCj4gIAk6ICJtZW1vcnki
KTsKPiAgCV9fZGlzYWJsZV91c2VyX2FjY2VzcygpOwo+ICAKPiAtLSAKPiAyLjQ4LjEKPgo+Cj4g
LS0gCj4gQW5kcmVhcyBTY2h3YWIsIFNVU0UgTGFicywgc2Nod2FiQHN1c2UuZGUKPiBHUEcgS2V5
IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBGNEJFICAxNzQ4IEU0RDQgODhFMyAw
RUVBIEI5RDcKPiAiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
