Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC61BEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4AozuhDCZ7MApcYKjVhvBa9KUEa9o+KxEbTjNOISqcI=; b=Y+tggjoKdGeGq6v9lzjpQimC5U
	ayQd0jU/k7uh6VPBHmf+IhQKxUO6HLKE+2Caarkt5hZF1xu00eZQplTozisO20luvYrWXBiQsHkWu
	S5HuWUCwhUD+awTHqmzjXwRR3q7tgFORDaLD5v9PfTsmpYdbh+LLuOqnszXvQS7ZJQRYdtQfIh+BY
	ZR9J8yGL1mehMNV/xSAfslVXdy3BrE13WLsi78TYh2v/Ccd1XT35UOx1X7TdoyJqLeeFCkfyQ8DcO
	08ESMKyugUaLD8IKqU4PUGkYI/0mp5J6rAMqr1udvRRS3PbReIv0Pl0nBZzfUBirHpDfZDOKbmnG0
	YMNkFvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJR-003f60-2E;
	Fri, 07 Jul 2023 05:47:25 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHeJM-003f2q-2F
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 05:47:23 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6686ef86110so927907b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 22:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688708839; x=1691300839;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAvpISnydoFWHqQk7bImyRAY/c0bnv6qrhMGgGyMhhY=;
        b=Zy8W5lHJTad1YEeB5b6krk0nPtoGPBw249SleGYm8eYRKDy8kgDHGRQmAzProRjj9C
         ZA6n1SHCyYdmza/16J5txdF8Ra3jP4vmGhNr1IJthuSYn5ENXEKDJQl9We1+hx4ExA3d
         4AipisBM0dD6HGPOrT7iGrAnl7Bw8xn5nPcE5ok762+55FapMBVfBrO3ODXjBWDu2QnA
         FH127RchZQiEDHkDo9k/YGkI74sazJJN3L5jP9r6djIW9XXe9C50u7ELdxFhgZJ4i1X4
         NVBTXF9X+sv3P4Xchgkx6K8WkmhCdcQTnhn/LH0R3Dpk2TvzKHGx5dcG3258TSqijQ6X
         sJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688708839; x=1691300839;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAvpISnydoFWHqQk7bImyRAY/c0bnv6qrhMGgGyMhhY=;
        b=K050ldjnwLAKF4uqPkzDjsZxAmRDe1ztfoP9itFuqJ5Q+3uHYvaAk1tjeeMxgIxy5j
         81UlS5FTZGe9Z67Hc7lPIjblwh0nlc2wE6NMCY/wmtuKy7es/Mobw++vj5vWpdXPdWy9
         YK4COxvkcsziGbUehS8jfXgEoHaWyuAf9BIZ49uIsBpjAbSD2WlIYstpKTjBCDgYAX9X
         LXkM9bYyjkbpPmXJMktIuXrfx9mhOPJ8UlozB5Wo8AbjANTSgFksl91NrcgYHuLnxUBT
         5O23s7QsH1ACaFBY0ZK/o2eejiA5WHcZo4S2M2ZnQ/vdQrfHMiF13bxSZ8wL8wun3fo9
         VKKQ==
X-Gm-Message-State: ABy/qLYaBWYAF+L0gaw17RTOH/tsbGPJhcNoMsUeWKnj4o2mnAn9rGVk
	G8LbyInY9oIEKORUz4nlSG5nog==
X-Google-Smtp-Source: APBJJlEkryK+Im9QKPXSsQlHuvQpZ2OrLluHoKw6NMANX53P/yWi8uzpp2a2uJLD9k+j67MTRXqQZQ==
X-Received: by 2002:a05:6a00:c87:b0:681:ccc3:3cd9 with SMTP id a7-20020a056a000c8700b00681ccc33cd9mr3759673pfv.19.1688708838768;
        Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l14-20020a65680e000000b0055b0c330b30sm1928754pgt.84.2023.07.06.22.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
Date: Thu, 06 Jul 2023 22:47:18 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 22:45:22 PDT (-0700)
Subject: Re: linux-next: Tree for Jul 6 (arch/riscv/)
In-Reply-To: <278886bf-f469-a8cc-130a-f3e4614e7e1f@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-0a55bc01-88cb-412a-ac38-7919f6f596fc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_224720_924028_8C925CE4 
X-CRM114-Status: GOOD (  19.96  )
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

T24gVGh1LCAwNiBKdWwgMjAyMyAxNjo0MDoyNyBQRFQgKC0wNzAwKSwgcmR1bmxhcEBpbmZyYWRl
YWQub3JnIHdyb3RlOgo+IEhpIFBhbG1lciwKPgo+IE9uIDcvNi8yMyAxNDo0NiwgUGFsbWVyIERh
YmJlbHQgd3JvdGU6Cj4+IE9uIFRodSwgMDYgSnVsIDIwMjMgMTQ6MzY6MDUgUERUICgtMDcwMCks
IHJkdW5sYXBAaW5mcmFkZWFkLm9yZyB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gNy82LzIzIDE0OjMy
LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+PiBPbiBUaHUsIDA2IEp1bCAyMDIzIDE0OjI3OjUz
IFBEVCAoLTA3MDApLCByZHVubGFwQGluZnJhZGVhZC5vcmcgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+
Pj4+IE9uIDcvNS8yMyAxODo1NywgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPj4+Pj4+IEhpIGFs
bCwKPj4+Pj4+Cj4+Pj4+PiBQbGVhc2UgZG8gKm5vdCogYWRkIGFueSB2Ni42IHJlbGF0ZWQgc3R1
ZmYgdG8geW91ciBsaW51eC1uZXh0IGluY2x1ZGVkCj4+Pj4+PiBicmFuY2hlcyB1bnRpbCBhZnRl
ciB2Ni41LXJjMSBoYXMgYmVlbiByZWxlYXNlZC4KPj4+Pj4+Cj4+Pj4+PiBDaGFuZ2VzIHNpbmNl
IDIwMjMwNzA1Ogo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gb24gcmlzY3Y2NDoKPj4+Pj4KPj4+Pj4gV0FS
TklORzogbW9kcG9zdDogdm1saW51eDogc2VjdGlvbiBtaXNtYXRjaCBpbiByZWZlcmVuY2U6ICR4
cnY2NGkycDFfbTJwMF9hMnAxX3ppY3NyMnAwX3ppZmVuY2VpMnAwX3ppaGludHBhdXNlMnAwX3pt
bXVsMXAwKzB4MTQgKHNlY3Rpb246IC50ZXh0LnVubGlrZWx5LnNldF9iaXQuY29uc3Rwcm9wLjAp
IC0+IG51bWFfbm9kZXNfcGFyc2VkIChzZWN0aW9uOiAuaW5pdC5kYXRhKQo+Pj4+Pgo+Pj4+Pgo+
Pj4+PiBGdWxsIHJhbmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4KPj4+Pgo+Pj4+IFRoYW5rcywg
SSdtIGdpdmluZyBpdCBhIGxvb2suwqAgRG8geW91IGhhcHBlbiB0byBhbHNvIGhhdmUgeW91ciB0
b29sY2hhaW4gdmVyc2lvbiBlYXNpbHkgYXZhaWxpYWJsZT/CoCBUaGUgbWFwcGluZyBzeW1ib2xz
IGFyZSBuZXcgYW5kIHdlJ3ZlIHNlZW4gc29tZSBvZGQgc3R1ZmYgaGFwcGVuLCBzb21ldGhpbmcg
aXMgbGlrZWx5IGJyb2tlbiBzb21ld2hlcmUuLi4KPj4+Cj4+PiBJJ20gdXNpbmcgZ2NjLTEzLjEu
MCBmcm9twqAgaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0
b29sLwo+Pgo+PiBDb29sLCB0aG9zZSBhcmUgcHJldHR5IGVhc3kgdG8gcnVuLsKgIEkndmUgeWV0
IHRvIGFjdHVhbGx5IHJlcHJvZHVjZSB0aGUKPj4gZmFpbHVyZXMsIGJ1dCBJJ2QgZ3Vlc3Mgd2Ug
anVzdCB3YW50IHRvIGlnbm9yZSB0aGUgbWFwcGluZyBzeW1ib2xzIHdpdGgKPj4gc29tZXRoaW5n
IGxpa2UKPj4KPj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvbW9kL21vZHBvc3QuYyBiL3NjcmlwdHMv
bW9kL21vZHBvc3QuYwo+PiBpbmRleCBiMjliMjk3MDdmMTAuLjJmODAxNDY5MzAxZCAxMDA2NDQK
Pj4gLS0tIGEvc2NyaXB0cy9tb2QvbW9kcG9zdC5jCj4+ICsrKyBiL3NjcmlwdHMvbW9kL21vZHBv
c3QuYwo+PiBAQCAtNjE0LDYgKzYxNCwxOCBAQCBzdGF0aWMgaW50IGlnbm9yZV91bmRlZl9zeW1i
b2woc3RydWN0IGVsZl9pbmZvICppbmZvLCBjb25zdCBjaGFyICpzeW1uYW1lKQo+PiDCoMKgwqDC
oMKgwqDCoCAvKiBFeHBvbGluZSB0aHVua3MgYXJlIGxpbmtlZCBvbiBhbGwga2VybmVsIG1vZHVs
ZXMgZHVyaW5nIGZpbmFsIGxpbmsgb2YgLmtvICovCj4+IMKgwqDCoMKgwqDCoMKgIGlmIChzdHJz
dGFydHMoc3ltbmFtZSwgIl9fczM5MF9pbmRpcmVjdF9qdW1wX3IiKSkKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMTsKPj4gKwo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIFJJ
U0MtViBkZWZpbmVzIHZhcmlvdXMgc3BlY2lhbCBzeW1ib2xzIHRoYXQgc3RhcnQgd2l0aCAiJCIu
wqAgVGhlCj4+ICvCoMKgwqDCoCAqIG1hcHBpbmcgc3ltYm9scywgd2hpY2ggZXhpc3QgdG8gZGlm
ZmVyZW50aWF0ZSBiZXR3ZWVuIGluY29tcGF0aWJsZQo+PiArwqDCoMKgwqAgKiBpbnN0cnVjdGlv
biBlbmNvZGluZ3Mgd2hlbiBkaXNhc3NlbWJsaW5nLCBzaG93IHVwIGFsbCBvdmVyIHRoZSBwbGFj
ZQo+PiArwqDCoMKgwqAgKiBhbmQgYXJlIGdlbmVyYWxseSBub3QgbWVhbnQgdG8gYmUgdHJlYXRl
ZCBsaWtlIG90aGVyIHN5bWJvbHMuwqAgU28KPj4gK8KgwqDCoMKgICoganVzdCBpZ25vcmUgYW55
IG9mIHRoZSBzcGVjaWFsIHN5bWJvbHMuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIGlmIChp
bmZvLT5oZHItPmVfbWFjaGluZSA9PSBFTV9SSVNDVikKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChz
eW1uYW1lWzBdID09ICckJykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4+
ICsKPj4gwqDCoMKgwqAvKiBEbyBub3QgaWdub3JlIHRoaXMgc3ltYm9sICovCj4+IMKgwqDCoMKg
cmV0dXJuIDA7Cj4+IH0KPj4KPj4gSSBoYXZlbid0IGV2ZW4gYnVpbHQgdGhhdCwgdGhvdWdoLi4u
Cj4KPiBUaGF0IGJ1aWxkcyB3aXRob3V0IGFueSBlcnJvcnMgb3Igd2FybmluZ3MsIGJ1dCBpdCBk
b2Vzbid0IGZpeCB0aGUgc2VjdGlvbiBtaXNtYXRjaAo+IHdhcm5pbmcuCgpUdXJucyBvdXQgdGhl
cmUncyBhIGhvb2sgZm9yIG1hcHBpbmcgc3ltYm9scywgdGhpcyBmaXhlcyBpdCBmb3IgbWU6Cgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNzA3MDU0MDA3LjMyNTkxLTEtcGFsbWVyQHJp
dm9zaW5jLmNvbS8KCj4+IFRoZXNlIGFsc28gdHJpcCB1cCBiYWNrdHJhY2VzLCBzbyB3ZSBwcm9i
YWJseSBuZWVkIHNvbWV0aGluZyBvdmVyIHRoZXJlIGFzCj4+IHdlbGwuCgpJIHRoaW5rIHRoYXQg
bWlnaHQgZml4IHRoZSBiYWNrdHJhY2VzIGFzIHdlbGwuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
