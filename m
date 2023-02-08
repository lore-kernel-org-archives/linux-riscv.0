Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C028DC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2jdp6CdRwH0ykyuJi47XCPOTU3p7PjnlVVsxMGDIIP4=; b=bvuQzqHkvlVTmcGMnj63MGGLT9
	SzCMpDQe0Hc8D8Gw8EwtHQcJVFw0Q/kB5Ms7njdirrcoyFGlYx3wnU7Y+wzLzsim7trO++/DZ2cu4
	0pNCTPfyV/XqdoioHo85VoyxM/xMHEInGdAbL2xR0QOckmWkoLInVge+4fsezPHK/vvQI+VRpUTpL
	xJ+wfUum596jAYcscykoR4ZmNxiiyQMigpEJsQsMUZh9M4eTdWlSvnEbErVv30GkPS3lrlSGC6okb
	y+3uGwmmD26hri3HmKaKccCW6S7CWD1BKliltTlcHFQZphrXIqJQ34U5PgbVm5nF9A8gfNEtNSf3I
	ZSXirxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPllK-00FxYj-2D; Wed, 08 Feb 2023 14:49:30 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPllH-00FxXb-4d
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 14:49:28 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 141so12854383pgc.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 06:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f51tcd2NdxaPHLUZNDwBySdZVDgdomB/5aEb1/nyTPA=;
        b=4RScORAhUv9+TfjOHyZGQTW7TsmGTGHRd8bGZciqQlcgUysKj3iFQC7OYDkASdPXaw
         BImEoQdlhKSNh9xClUzgqUUscF2xkOFYFlMaa69tcgKK9PmmR7PKY6uZ0dFv/AM6cVHK
         xpIEjsYNKkHcq5G31Inx+u3uxsTcfFI4DzNAbOIGnlifNf167TXs2BeQ8dDAPMa1f9Gu
         gcLMovOgdt2FoVRDhwEa7KqeYr/2Wf2n+8IIMuPIYhG76CqZ7LWlx97M+V2NmkOdnY1E
         04GS6vY9rpid+svAe3Huf3cFju0rzMT7mrgY21sz1sFkBCyI0IgC7L+WdWeL3bhJNCoe
         t+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f51tcd2NdxaPHLUZNDwBySdZVDgdomB/5aEb1/nyTPA=;
        b=rsyliP3LYLcQmOgslNjncGyJGyhwkxh3Hrk7aR/Qnx1pMjy2UoDWkYReDpgXQAiNyd
         boYihWwz4LANnjSKdMFfsd8Y9S643cqRcXVcfJZHxbm3daNy66RAmxE7h+LlYvXi1usE
         dtqcs5mLDqrLPmd/pN6b2C8M/5gV/WvMnLJ7+LLv4llf1IhkGzhMAFMSYSlkKUjcrFem
         G3vgyUxqyfyoBqleBC17oq+ciSFk4CWo2XajBHXTMzhRdSay/Mzw0RI9E2Lo+auFxRd0
         h/SwUGuqYRqeaStwuSS35seFZcetNVpDOV3R3hC/B8N+XlDS8LZn7MVOZfqR7Elbyo+Z
         BdjA==
X-Gm-Message-State: AO0yUKWhPSarsawWA09BRObBl/LMFCazioX9Aybp6W92To9sLrlXe7EG
	1+iSO7QwNH9cJvMUuGexYoV2sb7OQdxILNP+iCw=
X-Google-Smtp-Source: AK7set+X0/zwt9ty5gvVm+4g+ZYuZ4WBObj3FCvOzeDRHSQ2YQ+LrApZiupBQ58AnUZRxeD6IaHGxQ==
X-Received: by 2002:aa7:9533:0:b0:5a8:2b95:baea with SMTP id c19-20020aa79533000000b005a82b95baeamr2339524pfp.34.1675867763334;
        Wed, 08 Feb 2023 06:49:23 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id x19-20020aa79193000000b005a84de20c24sm112368pfa.209.2023.02.08.06.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:49:22 -0800 (PST)
Date: Wed, 08 Feb 2023 06:49:22 -0800 (PST)
X-Google-Original-Date: Wed, 08 Feb 2023 06:49:18 PST (-0800)
Subject: Re: [PATCH] MAINTAINERS: update Allwinner sunXi SoC support entry
In-Reply-To: <20230208142841.19597-1-twoerner@gmail.com>
CC: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: twoerner@gmail.com
Message-ID: <mhng-62becd72-44ff-41be-a90f-5de97e44b857@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_064927_400652_9DC6EEE4 
X-CRM114-Status: GOOD (  17.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBGZWIgMjAyMyAwNjoyODo0MSBQU1QgKC0wODAwKSwgdHdvZXJuZXJAZ21haWwu
Y29tIHdyb3RlOgo+IFVwZGF0ZSB0aGUgaW5mb3JtYXRpb24gaW4gdGhlICJBbGx3aW5uZXIgc3Vu
WGkgU29DIHN1cHBvcnQiIGJsb2NrOgo+IC0gaW5jbHVkZSBtb3JlIFJJU0MtViBpbmZvcm1hdGlv
bgo+IC0gbW92ZSB0aGUgYmxvY2sgdG8ga2VlcCBpdCBpbiBhbHBoYWJldGljYWwgb3JkZXIKPiAt
ICJMIiBiZWZvcmUgIlQiIChhcyByZXBvcnRlZCBieSBjaGVja3BhdGNoLnBsKQo+Cj4gU2lnbmVk
LW9mZi1ieTogVHJldm9yIFdvZXJuZXIgPHR3b2VybmVyQGdtYWlsLmNvbT4KPiAtLS0KPiAgTUFJ
TlRBSU5FUlMgfCAzNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBiOGFkODQ0YmNhNzcuLmZm
MzlkMzRjYjRjYSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJT
Cj4gQEAgLTE4NTYsMjMgKzE4NTYsNiBAQCBNOglFbWlsaW8gTMOzcGV6IDxlbWlsaW9AZWxvcGV6
LmNvbS5hcj4KPiAgUzoJTWFpbnRhaW5lZAo+ICBGOglkcml2ZXJzL2Nsay9zdW54aS8KPgo+IC1B
Uk0vQWxsd2lubmVyIHN1blhpIFNvQyBzdXBwb3J0Cj4gLU06CUNoZW4tWXUgVHNhaSA8d2Vuc0Bj
c2llLm9yZz4KPiAtTToJSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4K
PiAtTToJU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLUw6CWxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJl
cnMpCj4gLVM6CU1haW50YWluZWQKPiAtVDoJZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdW54aS9saW51eC5naXQKPiAtTDoJbGludXgtc3VueGlAbGlz
dHMubGludXguZGV2Cj4gLUY6CWFyY2gvYXJtL21hY2gtc3VueGkvCj4gLUY6CWFyY2gvYXJtNjQv
Ym9vdC9kdHMvYWxsd2lubmVyLwo+IC1GOglkcml2ZXJzL2Nsay9zdW54aS1uZy8KPiAtRjoJZHJp
dmVycy9waW5jdHJsL3N1bnhpLwo+IC1GOglkcml2ZXJzL3NvYy9zdW54aS8KPiAtTjoJYWxsd2lu
bmVyCj4gLU46CXN1blt4NDU2Nzg5XWkKPiAtTjoJc3VuWzI1XTBpCj4gLQo+ICBBUk0vQW1sb2dp
YyBNZXNvbiBTb0MgQ0xPQ0sgRlJBTUVXT1JLCj4gIE06CU5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPgo+ICBNOglKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJl
LmNvbT4KPiBAQCAtMjYyMCw2ICsyNjAzLDI1IEBAIEY6CWFyY2gvYXJtL2Jvb3QvZHRzL3J0ZCoK
PiAgRjoJYXJjaC9hcm0vbWFjaC1yZWFsdGVrLwo+ICBGOglhcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
YWx0ZWsvCj4KPiArQVJNL1JJU0MtVi9BbGx3aW5uZXIgc3VuWGkgU29DIHN1cHBvcnQKPiArTToJ
Q2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+ICtNOglKZXJuZWogU2tyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPgo+ICtNOglTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5k
Lm9yZz4KPiArTDoJbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0
ZWQgZm9yIG5vbi1zdWJzY3JpYmVycykKPiArTDoJbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ICtMOglsaW51eC1zdW54aUBsaXN0cy5saW51eC5kZXYKPiArUzoJTWFpbnRhaW5lZAo+
ICtUOglnaXQgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N1
bnhpL2xpbnV4LmdpdAo+ICtGOglhcmNoL2FybS9tYWNoLXN1bnhpLwo+ICtGOglhcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci8KPiArRjoJYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIv
CgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ICMgUklTQy1W
CgpUaGFua3MhCgo+ICtGOglkcml2ZXJzL2Nsay9zdW54aS1uZy8KPiArRjoJZHJpdmVycy9waW5j
dHJsL3N1bnhpLwo+ICtGOglkcml2ZXJzL3NvYy9zdW54aS8KPiArTjoJYWxsd2lubmVyCj4gK046
CXN1blt4NDU2Nzg5XWkKPiArTjoJc3VuWzI1XTBpCj4gKwo+ICBBUk0vUklTQy1WL1JFTkVTQVMg
QVJDSElURUNUVVJFCj4gIE06CUdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+Cj4gIE06CU1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
