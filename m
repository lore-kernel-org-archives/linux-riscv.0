Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C035C433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 07:50:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DC761358
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 07:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DC761358
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6oNVY6xbPQe1negcIbaSBX3WELw7xCz76jNzGGhhLmU=; b=rAiVpwRYsWj2zeQmHM0y1IB+/
	Svdg4UoKqdow62c/IdzoAG07fJyLMeRy9ugzzPQ6lJwSz3nouMoXdDXHSR7e0yZpJuytfhMBe5GfL
	VUl+0HrvJ40jYLzfFiLh0CkjVlc77t5w5b0l8NxA+8HhreUAvNPoasfltm66PHE6pPKtPBdeAEjBS
	bdgsj0lxENb9VkUzvb1clehBzvPrie1j6b5H+92q7FspW4or58GXiIeBlzkz5LKY3cX4CMtEKCFVG
	HBBBkzS5seJTNn51XqeWB6rQePZ32VOmSbAaO6rMw6N/KphIaOYWjbGPSOagDwyCUmmWwcTntKB5l
	fRzmpc07g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVrKK-0061Eo-7S; Mon, 12 Apr 2021 07:49:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrKD-0061EG-A9
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 07:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=qFK3ymFR+8IkY/EyN1emVbVTfc7jJvlULyoMvBmBots=; b=46Tpdb/4c4PnjQC56wryGzp38b
 NApzC8dEFQTkCbcsSD65v7u+OsYbdZutREINiFnpGFEqsKrGGDR02QKiD3LgvMegNCOt2RZR8UBZm
 O5YzBOaTRI4hcdXyFXhJ+kr6tIkqaBnZLf/6ZdHK4MCcSGUX1lE6ARqxGr5aG29VWHNkANXPwoQyM
 nAEaFMUYCpIPXgEQqltUW/NwDx02KA4hpiX3vhNIz76EAQKSuaYl9pv7OQXNEXA1U1jAw5MCAtgb7
 pdcxOBAYW4SbofSXnWMd/Z6TJnjEg2lIT2hwGrp00On1B2YZdcD4UwFslKhqQLlHnVsQHoXlJx83I
 mhjRMyAw==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVrKA-005wNC-If
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 07:49:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id z13so2776600lfd.9
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 00:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qFK3ymFR+8IkY/EyN1emVbVTfc7jJvlULyoMvBmBots=;
 b=Soa1RlqoeN2pveBDhZJ7t62minjfgT/bCsZg0/EBGI558bQ/bao3frHXP0Rz7qclWJ
 XlL0cuJODa1mwy5dDSETOj5ECqGIfCVjJ14QfQ6C5VOOVsvvjSbiWgX64VQqQHkhUMIC
 eOC6tA7GhvnTU36knNTYZi4yN5tdqRic44hco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qFK3ymFR+8IkY/EyN1emVbVTfc7jJvlULyoMvBmBots=;
 b=XwlPZdqZ4CTPA9SUfvvFlcIENXZrWi9frMFLBAgLi90pOiPqxSuhXDDcS3IUeSWfLl
 8rjgQ4qC84wChNuo76iW7ciGKKBuEpnbF0rl/sAHEOvmeKo9vf5nsPGjZIFKLyQ7532B
 EgX+hLZq2xt8F/f/hC3j66hVR1/U8KCA6PbntZKXbAJYqCAPkD7yL050XP8/7Cz3KP12
 d0HiOvkqsr7xuwA4HxZcRcJthtIv1l+F+5tnalOdOBxKieaZxR5MV5pMka8fQkVE7L0q
 HRd/xeRFkpTYqMZOt30DRJSd+4t3DipsDQslxyLg6YlPUEtUp7SeeCH9D+me7uRjaqvT
 5LEA==
X-Gm-Message-State: AOAM533R2j2gOptIesEAojTj+Qn10Zm2LyL8bmCRs7GSr24XcoEQIe/v
 US4/5kmK4B155MFhC6UWSQrmVtv8LKsazamA2Zv3PTqbixay6Q==
X-Google-Smtp-Source: ABdhPJwBRSVhNhw4No6L7/vBHycAOzfNc3erh48gevSjcRU17HxBGnY6Rhiut8kw7o9Ldf5DIb/dwWKFzUtR20neYAw=
X-Received: by 2002:ac2:59c2:: with SMTP id x2mr4535970lfn.407.1618213771658; 
 Mon, 12 Apr 2021 00:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210409065115.11054-1-alex@ghiti.fr>
 <3500f3cb-b660-5bbc-ae8d-0c9770e4a573@ghiti.fr>
 <be575094-badf-bac7-1629-36808ca530cc@redhat.com>
 <c4e78916-7e4c-76db-47f6-4dda3f09c871@ghiti.fr>
 <YHBEsDuEvPAnL8Vb@linux.ibm.com>
 <e7e87306-bb04-2d4f-7e7f-aabd40dccb3b@redhat.com>
 <YHBdzPsHantT9r8t@linux.ibm.com>
 <CAM4kBBKyHSYz+NNDpT=fWseWccsQ4HZ3teBc01jYT2g8j7Ze2A@mail.gmail.com>
 <ec1117a5-63fa-f800-1193-b5737eee6150@ghiti.fr>
In-Reply-To: <ec1117a5-63fa-f800-1193-b5737eee6150@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 12 Apr 2021 09:49:20 +0200
Message-ID: <CAM4kBBKijvZrpZPw4JLwdx+w+NEz4ceEwDSYh5xPgrqZx5Xkjw@mail.gmail.com>
Subject: Re: [PATCH v7] RISC-V: enable XIP
To: Alex Ghiti <alex@ghiti.fr>
Cc: Mike Rapoport <rppt@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-arch@vger.kernel.org, 
 Linux-MM <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_004934_644301_1CDBC095 
X-CRM114-Status: GOOD (  38.97  )
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

T24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgNzoxMiBBTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZy
PiB3cm90ZToKPgo+IExlIDQvOS8yMSDDoCAxMDo0MiBBTSwgVml0YWx5IFdvb2wgYSDDqWNyaXQg
Ogo+ID4gT24gRnJpLCBBcHIgOSwgMjAyMSBhdCAzOjU5IFBNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBGcmksIEFwciAwOSwgMjAyMSBhdCAw
Mjo0NjoxN1BNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiA+Pj4+Pj4gQWxzbywg
d2lsbCB0aGF0IG1lbW9yeSBwcm9wZXJseSBiZSBleHBvc2VkIGluIHRoZSByZXNvdXJjZSB0cmVl
IGFzCj4gPj4+Pj4+IFN5c3RlbSBSQU0gKGUuZy4sIC9wcm9jL2lvbWVtKSA/IE90aGVyd2lzZSBz
b21lIHRoaW5ncyAoL3Byb2Mva2NvcmUpCj4gPj4+Pj4+IHdvbid0IHdvcmsgYXMgZXhwZWN0ZWQg
LSB0aGUga2VybmVsIHdvbid0IGJlIGluY2x1ZGVkIGluIGEgZHVtcC4KPiA+Pj4+IERvIHdlIHJl
YWxseSBuZWVkIGEgWElQIGtlcm5lbCB0byBpbmNsdWRlZCBpbiBrZHVtcD8KPiA+Pj4+IEFuZCBk
b2VzIG5vdCBpdCBzb3VuZCB3ZWlyZCB0byBleHBvc2UgZmxhc2ggYXMgU3lzdGVtIFJBTSBpbiAv
cHJvYy9pb21lbT8gOy0pCj4gPj4+Cj4gPj4+IFNlZSBteSBvdGhlciBtYWlsLCBtYXliZSB3ZSBh
Y3R1YWxseSB3YW50IHNvbWV0aGluZyBkaWZmZXJlbnQuCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4+IEkg
aGF2ZSBqdXN0IGNoZWNrZWQgYW5kIGl0IGRvZXMgbm90IGFwcGVhciBpbiAvcHJvYy9pb21lbS4K
PiA+Pj4+Pgo+ID4+Pj4+IE9rIHlvdXIgY29uY2x1c2lvbiB3b3VsZCBiZSB0byBoYXZlIHN0cnVj
dCBwYWdlLCBJJ20gZ29pbmcgdG8gaW1wbGVtZW50IHRoaXMKPiA+Pj4+PiB2ZXJzaW9uIHRoZW4g
dXNpbmcgbWVtYmxvY2sgYXMgeW91IGRlc2NyaWJlZC4KPiA+Pj4+Cj4gPj4+PiBJJ20gbm90IHN1
cmUgdGhpcyBpcyByZXF1aXJlZC4gV2l0aCBYSVAga2VybmVsIHRleHQgbmV2ZXIgZ2V0cyBpbnRv
IFJBTSwgc28KPiA+Pj4+IGl0IGRvZXMgbm90IHNlZW0gdG8gcmVxdWlyZSBzdHJ1Y3QgcGFnZS4K
PiA+Pj4+Cj4gPj4+PiBYSVAgYnkgZGVmaW5pdGlvbiBoYXMgc29tZSBsaW1pdGF0aW9ucyByZWxh
dGl2ZWx5IHRvICJub3JtYWwiIG9wZXJhdGlvbiwKPiA+Pj4+IHNvIGxhY2sgb2Yga2R1bXAgY291
bGQgYmUgb25lIG9mIHRoZW0uCj4gPj4+Cj4gPj4+IEkgYWdyZWUuCj4gPj4+Cj4gPj4+Pgo+ID4+
Pj4gSSBtaWdodCBiZSB3cm9uZywgYnV0IElNSE8sIGFydGlmaWNpYWxseSBjcmVhdGluZyBhIG1l
bW9yeSBtYXAgZm9yIHBhcnQgb2YKPiA+Pj4+IGZsYXNoIHdvdWxkIGNhdXNlIG1vcmUgcHJvYmxl
bXMgaW4gdGhlIGxvbmcgcnVuLgo+ID4+Pgo+ID4+PiBDYW4geW91IGVsYWJvcmF0ZT8KPiA+Pgo+
ID4+IE5vdGhpbmcgcGFydGljdWxhciwganVzdCBhIGd1dCBmZWVsaW5nLiBVc3VhbGx5LCB3aGVu
IHlvdSBmb3JjZSBzb21ldGhpbmcKPiA+PiBpdCBjb21lcyBvdXQgdGhlIHdyb25nIHdheSBsYXRl
ci4KPiA+Cj4gPiBJdCdzIHBvc3NpYmxlIHN0aWxsIHRoYXQgTVREX1hJUCBpcyBpbXBsZW1lbnRl
ZCBhbGxvd2luZyB0byB3cml0ZSB0bwo+ID4gdGhlIGZsYXNoIHVzZWQgZm9yIFhJUC4gV2hpbGUg
Zmxhc2ggaXMgYmVpbmcgd3JpdHRlbiwgbWVtb3J5IG1hcAo+ID4gZG9lc24ndCBtYWtlIHNlbnNl
IGF0IGFsbC4gSSBjYW4ndCBjb21lIHVwIHdpdGggYSByZWFsIGxpZmUgZXhhbXBsZQo+ID4gd2hl
biBpdCBjYW4gYWN0dWFsbHkgbGVhZCB0byBwcm9ibGVtcyBidXQgaXQgaXMgaW5kZWVkIHdlaXJk
IHdoZW4KPiA+IFN5c3RlbSBSQU0gc3VkZGVubHkgYmVjb21lcyB1bnJlYWRhYmxlLiBJIHJlYWxs
eSBkb24ndCB0aGluayBleHBvc2luZwo+ID4gaXQgaW4gL3Byb2MvaW9tZW0gaXMgYSBnb29kIGlk
ZWEuCj4gPgo+ID4+Pj4gQlRXLCBob3cgZG9lcyBYSVAgYWNjb3VudCB0aGUga2VybmVsIHRleHQg
b24gb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0Cj4gPj4+PiBpbXBsZW1lbnQgaXQ/Cj4gPj4+Cj4g
Pj4+IEludGVyZXN0aW5nIHBvaW50LCBJIHRob3VnaHQgWElQIHdvdWxkIGJlIHNvbWV0aGluZyBu
ZXcgb24gUklTQy1WICh3ZWxsLCBhdAo+ID4+PiBsZWFzdCB0byBtZSA6KSApLiBJZiB0aGF0IGNv
bmNlcHQgZXhpc3RzIGFscmVhZHksIHdlIGJldHRlciBtaW1pYyB3aGF0Cj4gPj4+IGV4aXN0aW5n
IGltcGxlbWVudGF0aW9ucyBkby4KPiA+Pgo+ID4+IEkgaGFkIHF1aWNrIGdsYW5jZSBhdCBBUk0s
IGl0IHNlZW1zIHRoYXQga2VybmVsIHRleHQgZG9lcyBub3QgaGF2ZSBtZW1vcnkKPiA+PiBtYXAg
YW5kIGRvZXMgbm90IHNob3cgdXAgaW4gU3lzdGVtIFJBTS4KPiA+Cj4gPiBFeGFjdGx5LCBhbmQg
SSBiZWxpZXZlIEFSTTY0IHdvbid0IGRvIHRoYXQgdG9vIHdoZW4gaXQgZ2V0cyBpdHMgb3duCj4g
PiBYSVAgc3VwcG9ydCAod2hpY2ggaXMgdW5kZXJ3YXkpLgo+ID4KPgo+Cj4gbWVtbWFwIGRvZXMg
bm90IHNlZW0gbmVjZXNzYXJ5IGFuZCBBUk0vQVJNNjQgZG8gbm90IHVzZSBpdC4KPgo+IEJ1dCBp
ZiBzb21lb25lIHRyaWVzIHRvIGdldCBhIHN0cnVjdCBwYWdlIGZyb20gYSBwaHlzaWNhbCBhZGRy
ZXNzIHRoYXQKPiBsaWVzIGluIGZsYXNoLCBhcyBtZW50aW9uZWQgYnkgRGF2aWQsIHRoYXQgY291
bGQgbGVhZCB0byBzaWxlbnQKPiBjb3JydXB0aW9ucyBpZiBzb21ldGhpbmcgZXhpc3RzIGF0IHRo
ZSBhZGRyZXNzIHdoZXJlIHRoZSBzdHJ1Y3QgcGFnZQo+IHNob3VsZCBiZS4gQW5kIGl0IGlzIGhh
cmQgdG8ga25vdyB3aGljaCBmZWF0dXJlcyBpbiB0aGUga2VybmVsIGRlcGVuZHMKPiBvbiB0aGF0
Lgo+Cj4gUmVnYXJkaW5nIFNQQVJTRU1FTSwgdGhlIHZtZW1tYXAgbGllcyBpbiBpdHMgb3duIHJl
Z2lvbiBzbyB0aGF0J3MKPiB1bmxpa2VseSB0byBoYXBwZW4sIHNvIHdlIHdpbGwgY2F0Y2ggdGhv
c2UgaW52YWxpZCBhY2Nlc3NlcyAoYW5kIHRoYXQncwo+IHdoYXQgSSBvYnNlcnZlZCBvbiByaXNj
dikuCj4KPiBCdXQgZm9yIEZMQVRNRU0sIG1lbW1hcCBpcyBpbiB0aGUgbGluZWFyIG1hcHBpbmcs
IHRoZW4gdGhhdCBjb3VsZCB2ZXJ5Cj4gbGlrZWx5IGhhcHBlbiBzaWxlbnRseS4KPgo+IENvdWxk
IGEgc2ltcGxlIHNvbHV0aW9uIGJlIHRvIGZvcmNlIFNQQVJTRU1FTSBmb3IgdGhvc2UgWElQIGtl
cm5lbHMgPwo+IFRoZW4gd3JvbmcgdGhpbmdzIGNvdWxkIGhhcHBlbiwgYnV0IHdlIHdvdWxkIHNl
ZSB0aG9zZSBhbmQgYXZvaWQKPiBzcGVuZGluZyBob3VycyB0byBkZWJ1ZyA6KQo+Cj4gSSB3aWxs
IGF0IGxlYXN0IHNlbmQgYSB2OCB0byByZW1vdmUgdGhlIHBmbl92YWxpZCBtb2RpZmljYXRpb25z
IGZvcgo+IEZMQVRNRU0gdGhhdCBub3cgcmV0dXJucyB0cnVlIHRvIHBmbiBpbiBmbGFzaC4KClRo
YXQgc291bmRzIGdvb2QgdG8gbWUuIEkgYW0gbm90IHZlcnkga2VlbiBvbiBzcGVuZGluZyAyMDBL
IG9uIHN0cnVjdApwYWdlcyBmb3IgZmxhc2ggKHdlIGNhbiB0aGluayBvZiB0aGlzIGFzIG9mIGFu
IG9wdGlvbiBidXQgSSB3b3VsZApkZWZpbml0ZWx5IGxpa2UgdG8gaGF2ZSB0aGUgb3B0aW9uIHRv
IGNvbXBpbGUgaXQgb3V0IGluIHRoZSBlbmQpLCBzbwpsZXQncyByZW1vdmUgcGZuX3ZhbGlkIGFu
ZCBmaXggdGhpbmdzIHRoYXQgd2lsbCBldmVudHVhbGx5IGJyZWFrLCBpZgpzb21lLgoKQmVzdCBy
ZWdhcmRzLAogICBWaXRhbHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
