Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DEFC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 06:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8772320811
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 06:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZzLkPhyX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iON1OMdx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8772320811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lniTpsA4w3+S19dRIJPFQMaLJgJnJINOp/LBu480QvA=; b=ZzLkPhyXLiDZ00jlvlw0rrAE2
	ZRshqge2CJVkS+4gtOnuycbyOyVo89iLEceFCqTmPRl6qTCQIWE/6H/zHd/Id5Gi/JZ5LWfO4zZBP
	nq8vj1nGUdHINUS+eAm3Hd/8qf2CikUoCoOCD5p79emFT6+OmWQ2xdTrLGTHhhwkxt+4uNNsWTmOR
	OfN1148kHfcnL7rJ5sLt3gjRIbCTtsk2VGp/BWLb6Kg1KeY6OKIc5mpwy/v3W6uFtxeKJImxp5EDR
	HP6m1R0kj6bh+uapbA9NuCPlc6cNEtYdoaIowr0wuw0fA907RflmJkkX1UZXQp3BETpBMNMW7F/pP
	D6xa+SkjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8g1F-0007bs-Ez; Tue, 26 Mar 2019 06:57:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8g18-0007SA-9y
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 06:57:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id j26so5805703pgl.5
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 23:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+hD2crRp7T1I99AuX7f+TrMvqk70hgO1EK3kUZjMIGY=;
 b=iON1OMdxkiGH6kgQQGDZj62r7FQ2jzKoDiLuAlokGeOLEh1lrnomU5IZh2B13E77Du
 +12uHRrPDUW1/VL1pX+UPv7ajoVANCGO2WGBFShzpAVjUyJ9Ftn/O5i8Ou7gQa40N38R
 NdNaZVu8b97aTEJx/yHPQ0zasMFJpPOHcl+M72SekbMvTxec+8WMlvopcqmh2yAQU2Tn
 Dy+TtHuZr6qVCCDh8YlEl6KfWTWrJ27OY1YFnYAMBqv8T7g1557AVqYWm76tcjov2hUE
 V8gOP48dpX2+nLQxnlefTlAWadwneLqzv3HHF51xi4bz0CfLLB1YtYeucM/7Je31rrWp
 8iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+hD2crRp7T1I99AuX7f+TrMvqk70hgO1EK3kUZjMIGY=;
 b=j2NttYknSukQLMSUlH8hUWP3akfCtgf2eOzYXyf45OBqN3XgA/EH01pq2VzQK/K9Tr
 OvdvOY8w+708/ECUTlCdT4J4a4j8oZ4nXDTI3QVu9SBYX3lwZdB1FdTWaMe8aZQ8PF50
 lF/nj6037Ocep5xjBJbYbi5Mx+vLniuACPlE0arJk2plSvb6PMcNoBjBH4ciWGXd4oCG
 rz2RqOzNg4NbzW3Q0G+XqHxZ6bKk0BAX7Vf6rgiwboR3IIDClIx5A8fWvqusZxc83K8d
 PwFQKSzs2o5qSWfOhifKuDYQHzeG2Yt9/iz++jzNFHzfAXZ0qPvITPBKY2gHfXuJ9bO+
 7R8A==
X-Gm-Message-State: APjAAAXnscUyeBjGNiP05NiRuvVN7IcY7CR/q91bwBWVFq+i9B7K7mHT
 2Ie1KmxWjywxc4EMCxVwsLzwyQ==
X-Google-Smtp-Source: APXvYqysHAmsKYapDc+qdOVujknx0+fj2yA5qG8OsfsOv/T7UgPi5emjTX+ybnVw1me1mxPi5nTRgw==
X-Received: by 2002:a65:4247:: with SMTP id d7mr9206897pgq.114.1553583421122; 
 Mon, 25 Mar 2019 23:57:01 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
 [2001:b011:7001:1270:b809:36ef:31ed:7980])
 by smtp.gmail.com with ESMTPSA id z6sm54931166pgo.31.2019.03.25.23.56.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Mar 2019 23:57:00 -0700 (PDT)
Date: Mon, 25 Mar 2019 23:57:00 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Mar 2019 23:54:23 PDT (-0700)
Subject: Re: Thoughts on kexec / SBI
In-Reply-To: <67571f5519274a4402d8b4b4f7b4a6f6@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-42436a7b-c173-40dd-b88b-0128f64e2986@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_235702_430843_D3BA1CE2 
X-CRM114-Status: GOOD (  22.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mick@ics.forth.gr, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNSBNYXIgMjAxOSAyMDoyNDozNCBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAxOS0wMy0yNiAwMzo1OCwgUGFsbWVyIERhYmJlbHQgzq3O
s8+BzrHPiM61Ogo+PiBPbiBTdW4sIDI0IE1hciAyMDE5IDE1OjE3OjEwIFBEVCAoLTA3MDApLCBt
aWNrQGljcy5mb3J0aC5nciB3cm90ZToKPj4+IEhlbGxvIEF0aXNoLAo+Pj4KPj4+IM6jz4TOuc+C
IDIwMTktMDMtMjQgMDA6MzEsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4+PiBIaSBOaWNr
LAo+Pj4+Cj4+Pj4gT24gTWFyIDIzLCAyMDE5LCBhdCAxMTowNSBBTSwgTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4KPj4+PiB3cm90ZToKPj4+Pgo+Pj4+PiBIZWxsbyBhbGwsCj4+
Pj4+Cj4+Pj4+IEknbSB3b3JraW5nIG9uIGltcGxlbWVudGluZyBrZXhlYyBvbiBSSVNDLVYgKGp1
c3Qga2V4ZWMgZm9yIG5vdywgbm90Cj4+Pj4+IGtkdW1wIHlldCkgc2luY2Ugd2Ugd2FudCB0byBi
ZSBhYmxlIHRvIHRlc3QgbmV3IGtlcm5lbCBpbWFnZXMgZWFzaWx5Cj4+Pj4+IG9uIG91ciB0ZXN0
YmVkcy4gSXQncyBwYXJ0IG9mIGEgbGFyZ2VyIHByb2plY3Qgd2hlcmUgSSdtIHRyeWluZyB0bwo+
Pj4+PiBoYXZlIGEgdW5pZmllZCB3YXkgb2YgdGVzdGluZyB2YXJpb3VzIGxpbnV4LWNhcGFibGUg
UklTQy1WIHRhcmdldHMKPj4+Pj4gKGh0dHBzOi8vZ2l0aHViLmNvbS9taWNrZmxlbW0veWFydnQg
WzFdKSB0aGF0IHdlIGhhdmUgb24gdGhlIGxhYi4KPj4+Pgo+Pj4+IEdyZWF0LiBUaGlzIHJlcG8g
d2lsbCBiZSB2ZXJ5IGhlbHBmdWwgdG8gYmVnaW5uZXJzLiBJIGhhZCBhIHF1aWNrCj4+Pj4gbG9v
awo+Pj4+IGF0IHRoZSBzaWZpdmUtZnU1NDAvY29tbWFuZHMuc2guCj4+Pj4gb2JqY29weSBzdGVw
IGlzIHJlZHVuZGFudCBmb3IgT3BlblNCSSBhcyBpdCBhbHJlYWR5IGdlbmVyYXRlcyB0aGUKPj4+
PiBmd19wYXlsb2FkLmJpbiBhcyB3ZWxsLgo+Pj4+Cj4+Pgo+Pj4gSSBob3BlIHNvLCB0aGFua3Mg
Zm9yIHRoZSB1cGRhdGUsIEkgcHJlZmVyIGl0IHRoaXMgd2F5IHNpbmNlIGl0IHNob3dzCj4+PiBo
b3cgdGhlIC5iaW4gaXMgZ2VuZXJhdGVkLgo+Pj4KPj4+Pj4gVGhlIGlzc3VlIGlzIHRoYXQgd2Ug
ZG9uJ3QgaGF2ZSBhIHdheSBvZiBzdG9wcGluZyB0aGUgc2Vjb25kYXJ5Cj4+Pj4+IGhhcnRzIGlu
IGEgcmVjb3ZlcmFibGUgd2F5LCBzbyBhdCB0aGlzIHBvaW50IEkgaGF2ZSB0d28gb3B0aW9ucywK
Pj4+Pj4gZWl0aGVyIEknbSBnb2luZyB0byBjYWxsIHNtcF9zZW5kX3N0b3AoKSBvbiBtYWNoaW5l
X3NodXRkb3duKCkgYW5kCj4+Pj4+IGNvbWUgYmFjayBmcm9tIGtleGVjIHdpdGggYSBzaW5nbGUg
aGFydCBydW5uaW5nICh3aGljaCBzaG91bGQgYmUKPj4+Pj4gZmluZSBmb3Iga2R1bXAgYnR3KSwg
b3IgSSBuZWVkIHRvIGhhdmUgYSByZXNlcnZlZCBtZW1vcnkgc3BhY2Ugd2hlcmUKPj4+Pj4gSSds
bCBoYXZlIHRvIGtlZXAgc29tZSBjb2RlIHRvIGJlIGV4ZWN1dGVkIGJ5IHRoZSBzZWNvbmRhcnkg
aGFydHMsCj4+Pj4+IHRoYXQgd2lsbCBiZSBwYXRjaGVkIGJ5IHRoZSBib290IGhhcnQgb25jZSB0
aGUgbmV3IGtlcm5lbCBpcyBpbgo+Pj4+PiBwbGFjZSwgdG8gbGV0IHRoZW0gZXhlY3V0ZSB0aGUg
bmV3IGtlcm5lbC4gVGhlIHNlY29uZCBvcHRpb24gaXMgdG9vCj4+Pj4+IGNvbXBsaWNhdGVkIGZv
ciBubyByZWFzb24gYW5kIGl0IGFsc28gcmVkdWNlcyB0aGUgZmxleGliaWxpdHkgb2YgdGhlCj4+
Pj4+IHByb2Nlc3Mgc2luY2Ugd2UgY2FuJ3QgdXNlIHRoZSB3aG9sZSBSQU0gZm9yIHRoZSBsb2Fk
ZWQga2ltYWdlLCBwbHVzCj4+Pj4+IGl0IHdpbGwgYmUgb2Jzb2xldGUgd2hlbiB3ZSBoYXZlIHBy
b3BlciBoYW5kbGluZyBvZiBDUFUgc3VzcGVuZCAvCj4+Pj4+IHBlci1oYXJ0IHJlc2V0LCB0aHJv
dWdoIFNCSS4gU28gSSdtIGdvaW5nIGZvciB0aGUgZmlyc3Qgb3B0aW9uIHVudGlsCj4+Pj4+IHRo
ZW4uCj4+Pj4+Cj4+Pj4+IEknZCBsaWtlIHRvIGp1bXAtc3RhcnQgdGhlIGRpc2N1c3Npb24gb24g
aG93IHdlIGNhbiBoYW5kbGUgdGhpbmdzCj4+Pj4+IHRocm91Z2ggU0JJLCBteSBpbml0aWFsIHRo
cm91Z2ggd2FzIHRoaXM6Cj4+Pj4+Cj4+Pj4+IGEpIEhhdmUgYSBuZXcgSVBJIGNvZGUgSVBJX1NV
U1BFTkQsIGhhbmRsZWQgYnkgdGhlIGZpcm13YXJlIChpdHMKPj4+Pj4gY29kZS9kYXRhIGlzIHBl
cnNpc3RlbnQgYWNyb3NzIGtleGVjcyksIHRoYXQgcHV0cyB0aGUgaGFydCBvbiBhIHdmaQo+Pj4+
PiBsb29wLCBjaGVja2luZyBmb3IgYSB2YXJpYWJsZSB0aGF0IGNvbnRhaW5zIHRoZSBuZXcgdmly
dHVhbCBhZGRyZXNzCj4+Pj4+IHRvIGp1bXAgdG8gKHdoZXJlIHRoZSBuZXcga2VybmVsIGlzIGxv
Y2F0ZWQpIG9uIHRoaXMgaGFydCdzIHNjcmF0Y2gKPj4+Pj4gYnVmZmVyLiBBbHRlcm5hdGl2ZWx5
IHRoaXMgY2FsbCBtYXkgZG8gcG93ZXIgbWFuYWdlbWVudCBhbmQKPj4+Pj4gY29tcGxldGVseSBz
aHV0IGRvd24gdGhlIENQVSwgaWYgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIHRoaXMuCj4+Pj4+Cj4+
Pj4+IGIpIEhhdmUgYW5vdGhlciBJUEkgY29kZSBJUElfUkVTVU1FLCB0aGF0IHdha2VzIHVwIHRo
ZSBoYXJ0cyBieQo+Pj4+PiBwcm92aWRpbmcgdGhlbSB3aXRoIHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
dG8ganVtcCB0by4gVGhpcyBjYW4gYmUgYQo+Pj4+PiBzaW1wbGUgd3JpdGUgb2YgdGhlIG5ldyBh
ZGRyZXNzIG9uIHRoZSByZW1vdGUgaGFydCdzIHNjcmF0Y2ggYnVmZmVyCj4+Pj4+ICsgaW50ZXJy
dXB0LCBvciBpdCBjYW4gdXNlIHBvd2VyIG1hbmFnZW1lbnQgdG8gcG93ZXIgdXAgdGhlIGhhcnQg
YW5kCj4+Pj4+IGVpdGhlciBwcm92aWRlIGl0IHdpdGggYSBuZXcgcmVzZXQgdmVjdG9yLCBvciBk
byBzb21lIGhhbmRsaW5nIG9uCj4+Pj4+IHRoZSBCb290Uk9NIGNvZGUgZm9yIHRoYXQgKHRoaXMg
YnR3IGlzIGFsc28gYW4gb3BlbiBkaXNjdXNzaW9uIG9uCj4+Pj4+IHRoZSBURUUgZ3JvdXAgd2hl
cmUgd2UgYXJlIGRpc2N1c3NpbmcgU2VjdXJlIEJvb3QpLiBBbHNvIGluIGNhc2UgdGhlCj4+Pj4+
IGhhcnQgaXMgYWxyZWFkeSBydW5uaW5nIChhbiBJUElfU1VTUEVORCBoYXNuJ3QgYmVlbiBzZW50
IG9uIGl0Cj4+Pj4+IGJlZm9yZSwgZS5nLiBkdXJpbmcgYm9vdCksIHRoZSBmaXJtd2FyZSB3aWxs
IGlnbm9yZSB0aGUgZXZlbnQsCj4+Pj4+IGFsdGVybmF0aXZlbHkgd2UgbWF5IGNhbGwgSVBJX1NV
U1BFTkQgb24gdGhlIGZpcm13YXJlIGR1cmluZyBib290IHNvCj4+Pj4+IHRoYXQgdGhlIGJvb3Qg
cHJvY2VzcyBoYXBwZW5zIHdpdGggYSBzaW5nbGUgaGFydCBhbmQgb3RoZXIgaGFydHMKPj4+Pj4g
d2FpdCBmb3IgdGhlIE9TIHRvIHdha2UgdGhlbSB1cC4KPj4+Pgo+Pj4+IExvb2tzIGdvb2QgdG8g
bWUuIEkgaGFkIHNpbWlsYXIgSVBJIGFwcHJvYWNoKElQSSBXQUtFVVApIGZvciBjcHUKPj4+PiBo
b3RwbHVnIGltcGxlbWVudGF0aW9uIGV4Y2VwdCB0aGUgcmVzdW1lIGFkZHJlc3MgcmVxdWlyZW1l
bnQuCj4+Pj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvOS82LzIxNCBbMl0KPj4+Pgo+Pj4+
IFRoZSBvbmx5IGlzc3VlIGlzIHRoYXQgd2l0aCBhbGwgdGhpcyBJUElzIHdpbGwgYmUgcmVkdW5k
YW50IHdoZW4gaGFydAo+Pj4+IHBvd2VyIG1hbmFnZW1lbnQgU0JJIGV4dGVuc2lvbiAoYSBtdWNo
IGNsZWFuZXIgaW50ZXJmYWNlKSB3aWxsIGJlCj4+Pj4gYXZhaWxhYmxlLiBNeSBob3RwbHVnIHBh
dGNoIGlzIG9uIGhvbGQgYmVjYXVzZSBvZiB0aGF0IHJlYXNvbiBhcwo+Pj4+IHdlbGwuCj4+Pj4K
Pj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQXRpc2gKPj4+Pgo+Pj4KPj4+IE15IHByb3Bvc2FsIGlz
IGFib3V0IHRoZSBuZXcgU0JJIEFQSS9leHRlbnNpb24sIGFzIEkgbWVudGlvbiB0aGVzZSBJUEkK
Pj4+IGNhbGxzIGknbSB0YWxraW5nIGFib3V0IG5lZWQgdG8gYmUgaW1wbGVtZW50ZWQgb24gdGhl
IGZpcm13YXJlIHNpZGUsCj4+PiB0aGV5IHdvbid0IGJlIGhhbmRsZWQgYnkgdGhlIE9TIGxpa2Ug
SVBJX1NPRlQuIFNvIHNpbmNlIHlvdSBwcmVmZXIgdG8KPj4+IGhhdmUgc2VwYXJhdGUgY2FsbHMg
Zm9yIGVhY2ggb2YgdGhlIGhhcnQgc3RhdGVzIHRoZSBpZGVhIGlzOgo+Pj4KPj4+IHNiaV9oYXJ0
X3N1c3BlbmQoY3B1bWFzaykgLT4gc2VuZCBhbiBJUElfU1VTUEVORCB0byBjcHVzIG9uIGNwdW1h
c2sKPj4+IHNiaV9oYXJ0X3Jlc3VtZShjcHVtYXNrKSAtPiBzZW5kIGFuIElQSV9SRVNVTUUgdG8g
Y3B1cyBvbiBjcHVtYXNrCj4+Cj4+IFRoZSBJUEkgdHlwZXMgYXJlIGN1cnJlbnRseSBub3QgZXhw
b3NlZCBiZXR3ZWVuIExpbnV4IGFuZCB0aGUgZmlybXdhcmUKPj4gYW5kIEknZCBsaWtlIHRvIGtl
ZXAgaXQgdGhhdCB3YXkuICBMZXQncyBqdXN0IHByb3RvdHlwZSB0aGUgZmlyc3QKPj4gdmVyc2lv
biBvZiB0aGUgaGFydCBwb3dlciBtYW5hZ2VtZW50IGV4dGVuc2lvbiBpbnN0ZWFkLiAgSW1wbGVt
ZW50aW5nCj4+IHRoZW0gaW4gdGhlIGZpcm13YXJlIHZpYSBJUElzIGlzIHRoZSBvbmx5IHZhbGlk
IG1lY2hhbmlzbSBvbiBvdXIKPj4gZXhpc3RpbmcgaW1wbGVtZW50YXRpb24sIGJ1dCB0aGUgY29k
ZXMgY2FuIHN0YXkgd2l0aGluIHRoZSBmaXJtd2FyZS4KPgo+IEkgaGFkIE9wZW5TQkkgaW4gbWlu
ZCB3aGVuIEkgbWVudGlvbmVkIHRoZSBJUElfKiBjb2RlcywgSSB0b3RhbGx5IGFncmVlCj4gd2l0
aCB5b3UgdGhlc2Ugc2hvdWxkbid0IGJlIGV4cG9zZWQgLyBoYW5kbGVkIGJ5IHRoZSBPUy4KCk9L
LCBjb29sLCBJIHRoaW5rIHdlJ3JlIGFsbCBvbiB0aGUgc2FtZSBwYWdlLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
