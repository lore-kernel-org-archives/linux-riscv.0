Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C531BC83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sTSlaz3kl9akGv1JnGFy3Z6VTSa6f1VCpfalTunXTtI=; b=rGh8eo0NTdcAzH/yCWmYKddb3g
	vw77g1zpiARqmuqUIPildXoUy7aEiAg2YgGOyHheTC5fsWb4Yzm/yXHcSzUtuQ6S00NnzhTVZIeNs
	dLhdhi+7PEJNZEpiSM6OLv2o4luLlfq47Eyv/6GzTTmBhHRcJM26o3yfRAphIsoTycI+w3kccp/LY
	kUc5bzdzbyOm5jl3mVNV4ZpsRPAU9Ql5JaPNKYYPgeF1iv6pakPtbRqNRlMDHBxFcofA+QzSGoHgi
	7FDMMHfZVlra+fvqtVq5NLoIMfgUYq2ucBMbRc4Ck2/u3zDogtCLpT0lEMl1s0KyBGnAYH35qjaj1
	1x7FRf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLe9-00Dcuf-1V;
	Wed, 30 Aug 2023 13:54:13 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLe6-00Dcto-0K
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:54:12 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bdc27e00a1so4214661a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1693403644; x=1694008444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzdL99VC81Ou2F+ipwGBRnVl4uI3qfhrxRwx9w/Xgbk=;
        b=zeUICjW1JwuE0kuD4sr9HQ0s/zzpj0PscGerscNFP3R8i2HtbgGm9BzeaMULG2l5Tx
         5lgcR3DKpzOVAA22xIiJaKaX+8Z03QwxGDQULyiVNHCT+m1tI9mZyMWy8YEFT/NAdnmu
         t3/PsdOVo50cKGoRUlCtSJO6wo+lby0gd+hwE8irwWR8a73WY+mpaw1UM05meqPG/C1Y
         OV5FYFQ8N/R1Z9ECf2wJj8wYcE2X1K05NqVO0aCF5U8F6+68nvxGGUHQynUP9e7TkeSp
         z5kHLneY8q3awxOoAt4WQqIcIsMHF3nKVMA+blrvqmWh5++gMxBcLpAfHFwCDEJhwQcb
         H/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693403644; x=1694008444;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzdL99VC81Ou2F+ipwGBRnVl4uI3qfhrxRwx9w/Xgbk=;
        b=GbMhmqkwC4CO2Zqo0RjaTv3+7loBljx/Q/85Qz+55vvcGKHiAYTvfjqJKlR5N9W+EQ
         koiMwjJ9eRb4ZVLn1tTZAFHImBD0NDpyKDBxyCUyRWl11sDXaALNtmjGhLtgxgon01Wv
         83Qe5bZrBz2od2CYqCklqUkO+OfSQ34sC9u5/ZOrSUjn1+I880kQr/xHtJF8rtC1QEg/
         izpFUutLJIDm9KIt9yaX0t10xyiewm2kOlau9PI8LlkV4/gRqw+KiHH+LAIVDsCxilsR
         PAWddo3gfspsCYyVNYrTzbxh6CBGUW3NbFU3QbAg+pMY+Iz0uDJ3fgsqwKniYsBrcoei
         Ypsg==
X-Gm-Message-State: AOJu0Yx8q7ohVCGsR+fFkZ5UE0emkPB12HRSPi6NjCDyn1TTL5fNAXAZ
	u1STgqVgIBs6QKZ9AW/zvSn0Mg==
X-Google-Smtp-Source: AGHT+IE4tkQFsFo3Pg17fUm5h2kmeambb/plImzXvc1WYiKRFwqpDv7t527ulUERQBi8+9y9g8Lu0w==
X-Received: by 2002:a05:6808:1156:b0:3a1:dd99:8158 with SMTP id u22-20020a056808115600b003a1dd998158mr2670079oiu.6.1693403644405;
        Wed, 30 Aug 2023 06:54:04 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id p25-20020aa78619000000b00686b649cdd0sm10150171pfn.86.2023.08.30.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:54:03 -0700 (PDT)
Date: Wed, 30 Aug 2023 06:54:03 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Aug 2023 06:54:01 PDT (-0700)
Subject: Re: [PATCH bpf-next v3 0/3] bpf, riscv: use BPF prog pack allocator in BPF JIT
In-Reply-To: <9ab91c63-0712-d2d8-9b2b-6f2098287baa@iogearbox.net>
CC: bjorn@kernel.org, puranjay12@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, pulehui@huawei.com, Conor Dooley <conor.dooley@microchip.com>, ast@kernel.org,
  andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com, kpsingh@kernel.org,
  bpf@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: daniel@iogearbox.net
Message-ID: <mhng-ac1c6e6a-8f27-4539-83bb-6c10ff4d264e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_065410_147239_C34D9A42 
X-CRM114-Status: GOOD (  28.57  )
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

T24gV2VkLCAzMCBBdWcgMjAyMyAwMToxODo0NiBQRFQgKC0wNzAwKSwgZGFuaWVsQGlvZ2VhcmJv
eC5uZXQgd3JvdGU6Cj4gT24gOC8yOS8yMyAxMjowNiBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToK
Pj4gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cj4+Cj4+PiBD
aGFuZ2VzIGluIHYyIC0+IHYzOgo+Pj4gMS4gRml4IG1heGltdW0gd2lkdGggb2YgY29kZSBpbiBw
YXRjaGVzIGZyb20gODAgdG8gMTAwLiBbQWxsIHBhdGNoZXNdCj4+PiAyLiBBZGQgY2hlY2tzIGZv
ciBjdHgtPnJvX2luc25zID09IE5VTEwuIFtQYXRjaCAzXQo+Pj4gMy4gRml4IGNoZWNrIGZvciBl
ZGdlIGNvbmRpdGlvbiB3aGVyZSBhbW91bnQgb2YgdGV4dCB0byBzZXQgPiAyICogcGFnZXNpemUK
Pj4+ICAgICBbUGF0Y2ggMSBhbmQgMl0KPj4+IDQuIEFkZCByZXZpZXdlZC1ieSBpbiBwYXRjaGVz
Lgo+Pj4gNS4gQWRkaW5nIHJlc3VsdHMgb2Ygc2VsZnRlc3QgaGVyZToKPj4+ICAgICBVc2luZyB0
aGUgY29tbWFuZDogLi90ZXN0X3Byb2dzIG9uIHFlbXUKPj4+ICAgICBXaXRob3V0IHRoZSBzZXJp
ZXM6IFN1bW1hcnk6IDMzNi8zMTYyIFBBU1NFRCwgNTYgU0tJUFBFRCwgOTAgRkFJTEVECj4+PiAg
ICAgV2l0aCB0aGlzIHNlcmllczogU3VtbWFyeTogMzM2LzMxNjIgUEFTU0VELCA1NiBTS0lQUEVE
LCA5MCBGQUlMRUQKPj4+Cj4+PiBDaGFuZ2VzIGluIHYxIC0+IHYyOgo+Pj4gMS4gSW1wbGVtZW50
IGEgbmV3IGZ1bmN0aW9uIHBhdGNoX3RleHRfc2V0X25vc3luYygpIHRvIGJlIHVzZWQgaW4gYnBm
X2FyY2hfdGV4dF9pbnZhbGlkYXRlKCkuCj4+PiAgICAgVGhlIGltcGxlbWVudGF0aW9uIGluIHYx
IGNhbGxlZCBwYXRjaF90ZXh0X25vc3luYygpIGluIGEgbG9vcCBhbmQgaXQgd2FzIGJhZCBhcyBp
dCB3b3VsZAo+Pj4gICAgIGNhbGwgZmx1c2hfaWNhY2hlX3JhbmdlKCkgZm9yIGV2ZXJ5IHdvcmQg
bWFraW5nIGl0IHJlYWxseSBzbG93LiBUaGlzIHdhcyBmb3VuZCBieSBydW5uaW5nCj4+PiAgICAg
dGhlIHRlc3RfdGFnIHNlbGZ0ZXN0IHdoaWNoIHdvdWxkIHRha2UgZm9yZXZlciB0byBjb21wbGV0
ZS4KPj4+Cj4+PiBIZXJlIGlzIHNvbWUgZGF0YSB0byBwcm92ZSB0aGUgVjIgZml4ZXMgdGhlIHBy
b2JsZW06Cj4+Pgo+Pj4gV2l0aG91dCB0aGlzIHNlcmllczoKPj4+IHJvb3RAcnYtc2VsZnRlc3Rl
cjp+L3NyYy9rc2VsZnRlc3QvYnBmIyB0aW1lIC4vdGVzdF90YWcKPj4+IHRlc3RfdGFnOiBPSyAo
NDA5NDUgdGVzdHMpCj4+Pgo+Pj4gcmVhbCAgICA3bTQ3LjU2MnMKPj4+IHVzZXIgICAgMG0yNC4x
NDVzCj4+PiBzeXMgICAgIDZtMzcuMDY0cwo+Pj4KPj4+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGll
ZDoKPj4+IHJvb3RAcnYtc2VsZnRlc3Rlcjp+L3NyYy9zZWxmdGVzdC9icGYjIHRpbWUgLi90ZXN0
X3RhZwo+Pj4gdGVzdF90YWc6IE9LICg0MDk0NSB0ZXN0cykKPj4+Cj4+PiByZWFsICAgIDdtMjku
NDcycwo+Pj4gdXNlciAgICAwbTI1Ljg2NXMKPj4+IHN5cyAgICAgNm0xOC40MDFzCj4+Pgo+Pj4g
QlBGIHByb2dyYW1zIGN1cnJlbnRseSBjb25zdW1lIGEgcGFnZSBlYWNoIG9uIFJJU0NWLiBGb3Ig
c3lzdGVtcyB3aXRoIG1hbnkgQlBGCj4+PiBwcm9ncmFtcywgdGhpcyBhZGRzIHNpZ25pZmljYW50
IHByZXNzdXJlIHRvIGluc3RydWN0aW9uIFRMQi4gSGlnaCBpVExCIHByZXNzdXJlCj4+PiB1c3Vh
bGx5IGNhdXNlcyBzbG93IGRvd24gZm9yIHRoZSB3aG9sZSBzeXN0ZW0uCj4+Pgo+Pj4gU29uZyBM
aXUgaW50cm9kdWNlZCB0aGUgQlBGIHByb2cgcGFjayBhbGxvY2F0b3JbMV0gdG8gbWl0aWdhdGUg
dGhlIGFib3ZlIGlzc3VlLgo+Pj4gSXQgcGFja3MgbXVsdGlwbGUgQlBGIHByb2dyYW1zIGludG8g
YSBzaW5nbGUgaHVnZSBwYWdlLiBJdCBpcyBjdXJyZW50bHkgb25seQo+Pj4gZW5hYmxlZCBmb3Ig
dGhlIHg4Nl82NCBCUEYgSklULgo+Pj4KPj4+IEkgZW5hYmxlZCB0aGlzIGFsbG9jYXRvciBvbiB0
aGUgQVJNNjQgQlBGIEpJVFsyXS4gSXQgaXMgYmVpbmcgcmV2aWV3ZWQgbm93Lgo+Pj4KPj4+IFRo
aXMgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgdGhlIEJQRiBwcm9nIHBhY2sgYWxsb2NhdG9yIGZvciB0
aGUgUklTQ1YgQlBGIEpJVC4KPj4+IFRoaXMgc2VyaWVzIG5lZWRzIGEgcGF0Y2hbM10gZnJvbSB0
aGUgQVJNNjQgc2VyaWVzIHRvIHdvcmsuCj4+Pgo+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+PiBQZXJmb3JtYW5jZSBBbmFseXNpcyBv
ZiBwcm9nIHBhY2sgYWxsb2NhdG9yIG9uIFJJU0NWNjQKPj4+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Pj4KPj4+IFRlc3Qgc2V0dXA6Cj4+
PiA9PT09PT09PT09PQo+Pj4KPj4+IEhvc3QgbWFjaGluZTogRGViaWFuIEdOVS9MaW51eCAxMSAo
YnVsbHNleWUpCj4+PiBRZW11IFZlcnNpb246IFFFTVUgZW11bGF0b3IgdmVyc2lvbiA4LjAuMyAo
RGViaWFuIDE6OC4wLjMrZGZzZy0xKQo+Pj4gdS1ib290LXFlbXUgVmVyc2lvbjogMjAyMy4wNytk
ZnNnLTEKPj4+IG9wZW5zYmkgVmVyc2lvbjogMS4zLTEKPj4+Cj4+PiBUbyB0ZXN0IHRoZSBwZXJm
b3JtYW5jZSBvZiB0aGUgQlBGIHByb2cgcGFjayBhbGxvY2F0b3Igb24gUlYsIGEgc3RyZXNzZXIK
Pj4+IHRvb2xbNF0gbGlua2VkIGJlbG93IHdhcyBidWlsdC4gVGhpcyB0b29sIGxvYWRzIDggQlBG
IHByb2dyYW1zIG9uIHRoZSBzeXN0ZW0gYW5kCj4+PiB0cmlnZ2VycyA1IG9mIHRoZW0gaW4gYW4g
aW5maW5pdGUgbG9vcCBieSBkb2luZyBzeXN0ZW0gY2FsbHMuCj4+Pgo+Pj4gVGhlIHJ1bm5lciBz
Y3JpcHQgc3RhcnRzIDIwIGluc3RhbmNlcyBvZiB0aGUgYWJvdmUgd2hpY2ggbG9hZHMgOCoyMD0x
NjAgQlBGCj4+PiBwcm9ncmFtcyBvbiB0aGUgc3lzdGVtLCA1KjIwPTEwMCBvZiB3aGljaCBhcmUg
YmVpbmcgY29uc3RhbnRseSB0cmlnZ2VyZWQuCj4+PiBUaGUgc2NyaXB0IGlzIHBhc3NlZCBhIGNv
bW1hbmQgd2hpY2ggd291bGQgYmUgcnVuIGluIHRoZSBhYm92ZSBlbnZpcm9ubWVudC4KPj4+Cj4+
PiBUaGUgc2NyaXB0IHdhcyBydW4gd2l0aCBmb2xsb3dpbmcgcGVyZiBjb21tYW5kOgo+Pj4gLi9y
dW4uc2ggInBlcmYgc3RhdCAtYSBcCj4+PiAgICAgICAgICAtZSBpVExCLWxvYWQtbWlzc2VzIFwK
Pj4+ICAgICAgICAgIC1lIGRUTEItbG9hZC1taXNzZXMgIFwKPj4+ICAgICAgICAgIC1lIGRUTEIt
c3RvcmUtbWlzc2VzIFwKPj4+ICAgICAgICAgIC1lIGluc3RydWN0aW9ucyBcCj4+PiAgICAgICAg
ICAtLXRpbWVvdXQgNjAwMDAiCj4+Pgo+Pj4gVGhlIG91dHB1dCBvZiB0aGUgYWJvdmUgY29tbWFu
ZCBpcyBkaXNjdXNzZWQgYmVsb3cgYmVmb3JlIGFuZCBhZnRlciBlbmFibGluZyB0aGUKPj4+IEJQ
RiBwcm9nIHBhY2sgYWxsb2NhdG9yLgo+Pj4KPj4+IFRoZSB0ZXN0cyB3ZXJlIHJ1biBvbiBxZW11
LXN5c3RlbS1yaXNjdjY0IHdpdGggOCBjcHVzLCAxNkcgbWVtb3J5LiBUaGUgcm9vdGZzCj4+PiB3
YXMgY3JlYXRlZCB1c2luZyBCam9ybidzIHJpc2N2LWNyb3NzLWJ1aWxkZXJbNV0gZG9ja2VyIGNv
bnRhaW5lciBsaW5rZWQgYmVsb3cuCj4+Pgo+Pj4gUmVzdWx0cwo+Pj4gPT09PT09PQo+Pj4KPj4+
IEJlZm9yZSBlbmFibGluZyBwcm9nIHBhY2sgYWxsb2NhdG9yOgo+Pj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pgo+Pj4gUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBm
b3IgJ3N5c3RlbSB3aWRlJzoKPj4+Cj4+PiAgICAgICAgICAgICA0OTM5MDQ4ICAgICAgaVRMQi1s
b2FkLW1pc3Nlcwo+Pj4gICAgICAgICAgICAgNTQ2ODY4OSAgICAgIGRUTEItbG9hZC1taXNzZXMK
Pj4+ICAgICAgICAgICAgICA0NjUyMzQgICAgICBkVExCLXN0b3JlLW1pc3Nlcwo+Pj4gICAgICAg
MTQ0MTA4MjA5Nzk5OCAgICAgIGluc3RydWN0aW9ucwo+Pj4KPj4+ICAgICAgICA2MC4wNDU3OTEy
MDAgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPj4+Cj4+PiBBZnRlciBlbmFibGluZyBwcm9nIHBhY2sg
YWxsb2NhdG9yOgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Cj4+
PiBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+Pj4KPj4+ICAg
ICAgICAgICAgIDM0MzAwMzUgICAgICBpVExCLWxvYWQtbWlzc2VzCj4+PiAgICAgICAgICAgICA1
MDA4NzQ1ICAgICAgZFRMQi1sb2FkLW1pc3Nlcwo+Pj4gICAgICAgICAgICAgIDQwOTk0NCAgICAg
IGRUTEItc3RvcmUtbWlzc2VzCj4+PiAgICAgICAxNDQxNTM1NjM3OTg4ICAgICAgaW5zdHJ1Y3Rp
b25zCj4+Pgo+Pj4gICAgICAgIDYwLjA0NjI5NjYwMCBzZWNvbmRzIHRpbWUgZWxhcHNlZAo+Pj4K
Pj4+IEltcHJvdmVtZW50cyBpbiBtZXRyaWNzCj4+PiA9PT09PT09PT09PT09PT09PT09PT09PQo+
Pj4KPj4+IEl0IHdhcyBleHBlY3RlZCB0aGF0IHRoZSBpVExCLWxvYWQtbWlzc2VzIHdvdWxkIGRl
Y3JlYXNlIGFzIG5vdyBhIHNpbmdsZSBodWdlCj4+PiBwYWdlIGlzIHVzZWQgdG8ga2VlcCBhbGwg
dGhlIEJQRiBwcm9ncmFtcyBjb21wYXJlZCB0byBhIHNpbmdsZSBwYWdlIGZvciBlYWNoCj4+PiBw
cm9ncmFtIGVhcmxpZXIuCj4+Pgo+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4+IFRoZSBpbXByb3ZlbWVudCBpbiBpVExCLWxvYWQtbWlzc2VzOiAtMzAu
NSAlCj4+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4K
Pj4+IEkgcmVwZWF0ZWQgdGhpcyBleHByaW1lbnQgbW9yZSB0aGFuIDEwMCB0aW1lcyBpbiBkaWZm
ZXJlbnQgc2V0dXBzIGFuZCB0aGUKPj4+IGltcHJvdmVtZW50IHdhcyBhbHdheXMgZ3JlYXRlciB0
aGFuIDMwJS4KPj4+Cj4+PiBUaGlzIHBhdGNoIHNlcmllcyBpcyBib290IHRlc3RlZCBvbiB0aGUg
U3RhcmZpdmUgVmlzaW9uRml2ZSAyIGJvYXJkWzZdLgo+Pj4gVGhlIHBlcmZvcm1hbmNlIGFuYWx5
c2lzIHdhcyBub3QgZG9uZSBvbiB0aGUgYm9hcmQgYmVjYXVzZSBpdCBkb2Vzbid0Cj4+PiBleHBv
c2UgaVRMQi1sb2FkLW1pc3NlcywgZXRjLiBUaGUgc3RyZXNzZXIgcHJvZ3JhbSB3YXMgcnVuIG9u
IHRoZSBib2FyZCB0byB0ZXN0Cj4+PiB0aGUgbG9hZGluZyBhbmQgdW5sb2FkaW5nIG9mIEJQRiBw
cm9ncmFtcwo+Pj4KPj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAyMjAyMDQx
ODU3NDIuMjcxMDMwLTEtc29uZ0BrZXJuZWwub3JnLwo+Pj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMDYyNjA4NTgxMS4zMTkyNDAyLTEtcHVyYW5qYXkxMkBnbWFpbC5jb20v
Cj4+PiBbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNjI2MDg1ODExLjMxOTI0
MDItMi1wdXJhbmpheTEyQGdtYWlsLmNvbS8KPj4+IFs0XSBodHRwczovL2dpdGh1Yi5jb20vcHVy
YW5qYXltb2hhbi9CUEYtQWxsb2NhdG9yLUJlbmNoCj4+PiBbNV0gaHR0cHM6Ly9naXRodWIuY29t
L2Jqb3RvL3Jpc2N2LWNyb3NzLWJ1aWxkZXIKPj4+IFs2XSBodHRwczovL3d3dy5zdGFyZml2ZXRl
Y2guY29tL2VuL3NpdGUvYm9hcmRzCj4+Pgo+Pj4gUHVyYW5qYXkgTW9oYW4gKDMpOgo+Pj4gICAg
cmlzY3Y6IGV4dGVuZCBwYXRjaF90ZXh0X25vc3luYygpIGZvciBtdWx0aXBsZSBwYWdlcwo+Pj4g
ICAgcmlzY3Y6IGltcGxlbWVudCBhIG1lbXNldCBsaWtlIGZ1bmN0aW9uIGZvciB0ZXh0Cj4+PiAg
ICBicGYsIHJpc2N2OiB1c2UgcHJvZyBwYWNrIGFsbG9jYXRvciBpbiB0aGUgQlBGIEpJVAo+Pgo+
PiBUaGFuayB5b3UhIEZvciB0aGUgc2VyaWVzOgo+Pgo+PiBBY2tlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KPj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4+Cj4+IEBBbGV4ZWkgQERhbmllbCBUaGlzIHNlcmllcyBkZXBlbmRzIG9u
IGEgY29yZSBCUEYgcGF0Y2ggZnJvbSB0aGUgQXJtCj4+ICAgICAgICAgICAgICAgICAgc2VyaWVz
IFszXS4KPj4KPj4gQFBhbG1lciBMTUsgaWYgeW91IGhhdmUgYW55IGNvbmNlcm5zIHRha2luZyB0
aGUgUklTQy1WIHRleHQgcGF0Y2hpbmcKPj4gICAgICAgICAgc3R1ZmYgdmlhIHRoZSBCUEYgdHJl
ZS4KPgo+IFBhbG1lciwgZGlkIHRoZSByaXNjdiBQUiBhbHJlYWR5IGdvIHRvIExpbnVzPwoKTm90
IHlldCwgSSB1c3VhbGx5IHNlbmQgb24gRnJpZGF5IG1vcm5pbmdzIC0tIGFuZCBJIGFsc28gZ2Vu
ZXJhbGx5IHNlbmQgCnR3bywgYXMgdGhlcmUncyBzb21lIHN0cmFnZ2xlcnMvZml4ZXMgZm9yIHRo
ZSBzZWNvbmQgd2Vlay4gIEknbSBmaW5lIAp0YWtpbmcgaXQgKEJqb3JuIGp1c3QgcG9rZWQgbWUp
LCBjYW4gc29tZW9uZSBwcm92aWRlIGEgYmFzZSBjb21taXQ/ICAKQmpvcm4gc2F5cyBpdCBkZXBl
bmRzIG9uIHNvbWV0aGluZyBpbiBMaW51cycgdHJlZSwgc28gSSdsbCBqdXN0IHBpY2sgaXQgCnVw
IGFzIGEgc3RyYWdnbGVyIGZvciBuZXh0IHdlZWsuCgpBbHNvLCBkbyB5b3UgbWluZCBzZW5kaW5n
IGFuIEFjaz8KCj4gSWYgbm90IHlldCwgcGVyaGFwcyB5b3UgY291bGQgc2hpcCB0aGlzIHNlcmll
cyBhbG9uZyB3aXRoIHlvdXIgUFIgdG8gTGludXMKPiBkdXJpbmcgdGhpcyBtZXJnZSB3aW5kb3cg
Z2l2ZW4gdGhlIGJpZyBuZXQgUFIgKGluY2wuIGJwZikgd2FzIGFscmVhZHkgbWVyZ2VkCj4geWVz
dGVyZGF5LiBTbyBmcm9tIG91ciBzaWRlIG9ubHkgZml4ZXMgc2hpcCB0byBMaW51cy4KPgo+IE90
aGVyd2lzZSB3ZSBjb3VsZCB0YWtlIGl0IGludG8gYnBmLW5leHQgZm9yIHRoZSBuZXh0IGRldiBj
eWNsZSBpZiB0aGVyZSBhcmUKPiBubyBvYmplY3Rpb25zLCBsZXQgdXMga25vdy4KPgo+IFRoYW5r
cywKPiBEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
