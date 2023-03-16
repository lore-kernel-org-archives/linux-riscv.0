Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDE2C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pu0/XK/1LHBdXRoGHdsrjUfYiD8WsqVYm05rVaYwJMU=; b=RhdKTtF4B9lIQu
	uUBfZYNwldCdDFPCmnYwS0SzPD3AWVb0VtYDy7JHHQPgFByv0UohZnVBSuAuXuFJc3BYXoydHzsm5
	VVJdhD1BDMi7UlQSzb41dkVH8OYJiw8XRKw6kYDaDQihtQ2QBmQahVeugBGsur//c7igpsSXJ3rVF
	wq6NjLQ2AZykwOlLqVlP9K3ljjIH/GEcQdwKPnh713kgCNyFlLmFoKsD/hzBew96Dl44pQQFnT493
	lGDZZyPikZIrA4pwG2NdLgDQUzvUkfD2nzN8gHmWLkz2d1+7nGY2t9Oi9MeyiC9Qzq0qJwEFiVTCQ
	+5446XXkG52wZWUR4QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcbDv-00Enbw-2B;
	Thu, 16 Mar 2023 00:12:03 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcbDs-00EnbJ-21
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 00:12:01 +0000
Received: by mail-il1-x134.google.com with SMTP id a13so110535ilr.9
        for <linux-riscv@lists.infradead.org>; Wed, 15 Mar 2023 17:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678925515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A4+6WNZrg0XE9F8HhNkuyqp/9CoWfXobBlodcYCH9M=;
        b=ap8M5WVhaHadtY35pgDPiuTL1iT97fh3CCDvrGknj7w0ooU+SFohasJWs6qoRpYo+E
         9U4ShDKBucbUUoAXtNnCPBor6lifNAt9z+kLGBba4yVhJridSKPdnPIpWUekDG869P9e
         aJeBnzY1UkLPkeLdH53Ei5iwwfFhpmALvitV7GojqE5l4aELOpVpVRil9Z32C1gipBAY
         9WBMyIK1eEawYEG5sa6eLvBtF0feZC+2qdLd7SNOqlcs7sb732ls4d2KvBMd7KpFYq0N
         dLMdJpDYI53rgwJH/0mM9+iTrpFZQqo8Lgkcvdoihw5NfOPaZvYJnGwLG1GgVYcdwa1r
         ETOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678925515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A4+6WNZrg0XE9F8HhNkuyqp/9CoWfXobBlodcYCH9M=;
        b=PsFB8lTO99FT8R6zCHTuRkS5YVtSircDiq7wIcmiURjahQ/VicFMXegRYM+ssQkTvv
         aHufv4s6njMfWdrw5tRtLP0aPJeACvnyJe6iVoCLA49dg9C2nPe72GapYIfdSBBaUSRG
         bZPg49WOqdvMrzw833YHcrHrLQTzMaSdVBQXfx98o7lWr1Et+hRZlANTLkDg7dRhYzp5
         kvJfeKa92dnJRl5rRt0plU8uEgEu+cQeSya/ZKt27rvTMp1d4jmDLY8hLN2Ng0qVgLdG
         rVInnjCprtJPgNj+8oQQmjEHXEzpFyNvSXan+fjeyYwUxRyO7CFsHJ+aaJoSWs6I60hu
         JE7g==
X-Gm-Message-State: AO0yUKW+Jol2asAS4dvA/UiJ+1ijsc6OY3WAL5Ln9geNAGz38VboD9qF
	OESCuRXwdKRZzT4BOI0PIAtt7F06DlaH6lIT67CtgQ==
X-Google-Smtp-Source: AK7set+A7BBRiTsFnL6nlX8eXSdT6HCEPYPWdoxP1z5nNV20cC7pviZfNP1E0fjsqMumMBseGhZMTD0Gi3RNQSq18Hs=
X-Received: by 2002:a05:6e02:1c89:b0:322:f3fb:6c45 with SMTP id
 w9-20020a056e021c8900b00322f3fb6c45mr71590ill.16.1678925514522; Wed, 15 Mar
 2023 17:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230315051500.13064-1-p4ranlee@gmail.com>
In-Reply-To: <20230315051500.13064-1-p4ranlee@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 15 Mar 2023 17:11:41 -0700
Message-ID: <CAP-5=fUsgxM5H0T9kDyLra=0UMHXRqvYNeYcLeKr7ruc74vq-A@mail.gmail.com>
Subject: Re: [PATCH v2] perf tools riscv: Add support for riscv lookup_binutils_path
To: Paran Lee <p4ranlee@gmail.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Anton Blanchard <anton@ozlabs.org>, Daniel Axtens <dja@axtens.net>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_171200_667043_4C371C33 
X-CRM114-Status: GOOD (  13.44  )
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

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6MTXigK9QTSBQYXJhbiBMZWUgPHA0cmFubGVlQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgUklTQy1WIGJpbnV0aWxzIHBhdGggb24gbG9va3VwIHRy
aXBsZXRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFyYW4gTGVlIDxwNHJhbmxlZUBnbWFpbC5jb20+
CgpBY2tlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLApJYW4K
Cj4gLS0tCj4gIHRvb2xzL3BlcmYvYXJjaC9jb21tb24uYyB8IDE4ICsrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3BlcmYvYXJjaC9jb21tb24uYyBiL3Rvb2xzL3BlcmYvYXJjaC9jb21tb24uYwo+IGluZGV4
IDU5ZGQ4NzVmZDVlNC4uZTgwZDRkMjJjYWJmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvYXJj
aC9jb21tb24uYwo+ICsrKyBiL3Rvb2xzL3BlcmYvYXJjaC9jb21tb24uYwo+IEBAIC00Myw2ICs0
MywyMCBAQCBjb25zdCBjaGFyICpjb25zdCBwb3dlcnBjX3RyaXBsZXRzW10gPSB7Cj4gICAgICAg
ICBOVUxMCj4gIH07Cj4KPiArY29uc3QgY2hhciAqY29uc3QgcmlzY3YzMl90cmlwbGV0c1tdID0g
ewo+ICsgICAgICAgInJpc2N2MzItdW5rbm93bi1saW51eC1nbnUtIiwKPiArICAgICAgICJyaXNj
djMyLWxpbnV4LWFuZHJvaWQtIiwKPiArICAgICAgICJyaXNjdjMyLWxpbnV4LWdudS0iLAo+ICsg
ICAgICAgTlVMTAo+ICt9Owo+ICsKPiArY29uc3QgY2hhciAqY29uc3QgcmlzY3Y2NF90cmlwbGV0
c1tdID0gewo+ICsgICAgICAgInJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtIiwKPiArICAgICAg
ICJyaXNjdjY0LWxpbnV4LWFuZHJvaWQtIiwKPiArICAgICAgICJyaXNjdjY0LWxpbnV4LWdudS0i
LAo+ICsgICAgICAgTlVMTAo+ICt9Owo+ICsKPiAgY29uc3QgY2hhciAqY29uc3QgczM5MF90cmlw
bGV0c1tdID0gewo+ICAgICAgICAgInMzOTAtaWJtLWxpbnV4LSIsCj4gICAgICAgICAiczM5MHgt
bGludXgtZ251LSIsCj4gQEAgLTE2Niw2ICsxODAsMTAgQEAgc3RhdGljIGludCBwZXJmX2Vudl9f
bG9va3VwX2JpbnV0aWxzX3BhdGgoc3RydWN0IHBlcmZfZW52ICplbnYsCj4gICAgICAgICAgICAg
ICAgIHBhdGhfbGlzdCA9IGFybTY0X3RyaXBsZXRzOwo+ICAgICAgICAgZWxzZSBpZiAoIXN0cmNt
cChhcmNoLCAicG93ZXJwYyIpKQo+ICAgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBwb3dlcnBj
X3RyaXBsZXRzOwo+ICsgICAgICAgZWxzZSBpZiAoIXN0cmNtcChhcmNoLCAicmlzY3YzMiIpKQo+
ICsgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSByaXNjdjMyX3RyaXBsZXRzOwo+ICsgICAgICAg
ZWxzZSBpZiAoIXN0cmNtcChhcmNoLCAicmlzY3Y2NCIpKQo+ICsgICAgICAgICAgICAgICBwYXRo
X2xpc3QgPSByaXNjdjY0X3RyaXBsZXRzOwo+ICAgICAgICAgZWxzZSBpZiAoIXN0cmNtcChhcmNo
LCAic2giKSkKPiAgICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gc2hfdHJpcGxldHM7Cj4gICAg
ICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJzMzkwIikpCj4gLS0KPiAyLjM0LjEKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
