Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C85FC001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTXPn2FnIYj/Y7+Xc5PuCcw/3LaJX9NsHwQmCx9QYow=; b=U4YMrPzWNvZ3nO
	x1KmrYvKE1Zk545b9/6y+/3K3lV/hqs3gwT546xuyX07qZHachdWWfoTs+lEm6QSl3xwlN2etZ5b7
	mniFM2ue5ObNlte4Qlfd80X9/tjbcBy51HyKdnQmm5Le8NiUi1HHTxcdBcMcDyB02MAMBLacHSwet
	iMNgFpS8tfBiosjrTwV0ftiFd2ZMXtTj4ClhQXQonCAeItclB4kWNrMLHrKXFypQHhDDWQos5Q/ps
	ZxA1nXiZWJ1IbTSPCwxWKOrIOiJqcZ22s9GWDuTA6Y9T3WYD2wNP+2VdAZMfXTYmYN8fiIAyZgho8
	MGV0eLfPJUhP+HGnHEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS0Hw-00D62V-2C;
	Fri, 04 Aug 2023 19:16:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS0Hs-00D611-0v
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 19:16:39 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52229f084beso3213157a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 12:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691176585; x=1691781385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TpiHH7yxmEW4ZBDV3OldglgWshd7L0knNrNdUQpdioM=;
        b=YAJzdBxxg5mIQRYms2BEh1R5Vm+87M4Q4TxeLUT6RyrNijHzA/zfWa8H8kWGxrNPHb
         pLSQGkFGRC+bMMLmtKGGjHbeBd7mRqnaM0RKHQ2SMoRcTLsMqb2dROGdWVGPAC4ALPFF
         p1+gVQ4GPOE3Cm6pvuRdA+HVsql1vapaQmn19SIqM+B3mtcjWWQBA2y/6aduYUN4jb+t
         CcZst0NISMfL4c15+SsZy4YBTodkMOkR0y62BIV5NxDTS3XIY4ZukAzfDH8UEOmg/qkZ
         ocgWF8BBF4w8GT1kFaFlkO+lMdUN61/bXJOa6YS6Dj8y40C6WWgdChIiQ6VVDs1Yl3hO
         TP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691176585; x=1691781385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpiHH7yxmEW4ZBDV3OldglgWshd7L0knNrNdUQpdioM=;
        b=laTIDdAnHLl4ccN4EErxgwaGmyLPaaSBEiYCpllVinjJN+QOvF8kmBXyw9ng/gpeH8
         UGI2HRTCrjr/YSh/G7yiiRjevGxQmCbXtYjgba3DjuQ0yWS71JM+czSbfXyuQoz+sp/c
         EIe/uNz2awgI6LROzr8aO1w5TI+kLHcsCekAag92/MVS+RSS1MDub37YZhUvtdD56Phv
         rauIUD7pxspKKE9Lor36vGIDtrFwkcXQWCgVNbNe2q0yQXPM7zN9B87GeYDygjbXjWoY
         pKf6qKHjGW9gSJoIFrZxsWbFXLzrpJw78+oMfZuBEwtqFeb/kQJbKrw9SXnQwvi0nz33
         OwKg==
X-Gm-Message-State: AOJu0YwyVd5EuJOpempUWHMjK3EXmvD1cJLSpfyiA9V0j1e0pYotwwmF
	fhRoLRYeLEh3V6gucz0gRpy6gl1J4Euoag==
X-Google-Smtp-Source: AGHT+IGjiRI/I3SynytvWznDJVkkJOCwpXVTgQMOfC1uzhrWOpNOGeKDVgG0KCt2koY6YDgn1s2Ftg==
X-Received: by 2002:a17:906:2182:b0:991:e7c2:d0be with SMTP id 2-20020a170906218200b00991e7c2d0bemr2435265eju.63.1691176585274;
        Fri, 04 Aug 2023 12:16:25 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id d24-20020a170906c21800b00989828a42e8sm1693018ejz.154.2023.08.04.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 12:16:24 -0700 (PDT)
Date: Fri, 4 Aug 2023 21:16:20 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZM1OhJY8/PZ/osTH@andrea>
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea>
 <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
 <ZMxDe0gXKYbY5jgt@andrea>
 <65350c17-3fcf-a057-a280-f6a5d36dcb21@efficios.com>
 <ZM0STfpkRSfNQBt8@andrea>
 <ab562167-e4a5-4a7d-7722-a4f99848d63e@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab562167-e4a5-4a7d-7722-a4f99848d63e@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_121636_327174_C3E67F17 
X-CRM114-Status: GOOD (  33.10  )
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

T24gRnJpLCBBdWcgMDQsIDIwMjMgYXQgMDI6MDU6NTVQTSAtMDQwMCwgTWF0aGlldSBEZXNub3ll
cnMgd3JvdGU6Cj4gT24gOC80LzIzIDEwOjU5LCBBbmRyZWEgUGFycmkgd3JvdGU6Cj4gPiA+IFdo
YXQgaXMgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIEZFTkNFLkkgYW5kIGluc3RydWN0aW9uIGNh
Y2hlIGZsdXNoIG9uCj4gPiA+IFJJU0MtViA/Cj4gPiAKPiA+IFRoZSBleGFjdCBuYXR1cmUgb2Yg
dGhpcyByZWxhdGlvbnNoaXAgaXMgaW1wbGVtZW50YXRpb24tZGVwZW5kZW50LiAgRnJvbQo+ID4g
Y29tbWVudGFyeSBpbmNsdWRlZCBpbiB0aGUgSVNBIHBvcnRpb24gcmVmZXJyZWQgdG8gaW4gdGhl
IGNoYW5nZWxvZzoKPiA+IAo+ID4gICAgQSBzaW1wbGUgaW1wbGVtZW50YXRpb24gY2FuIGZsdXNo
IHRoZSBsb2NhbCBpbnN0cnVjdGlvbiBjYWNoZSBhbmQKPiA+ICAgIHRoZSBpbnN0cnVjdGlvbiBw
aXBlbGluZSB3aGVuIHRoZSBGRU5DRS5JIGlzIGV4ZWN1dGVkLiAgQSBtb3JlCj4gPiAgICBjb21w
bGV4IGltcGxlbWVudGF0aW9uIG1pZ2h0IHNub29wIHRoZSBpbnN0cnVjdGlvbiAoZGF0YSkgY2Fj
aGUgb24KPiA+ICAgIGV2ZXJ5IGRhdGEgKGluc3RydWN0aW9uKSBjYWNoZSBtaXNzLCBvciB1c2Ug
YW4gaW5jbHVzaXZlIHVuaWZpZWQKPiA+ICAgIHByaXZhdGUgTDIgY2FjaGUgdG8gaW52YWxpZGF0
ZSBsaW5lcyBmcm9tIHRoZSBwcmltYXJ5IGluc3RydWN0aW9uCj4gPiAgICBjYWNoZSB3aGVuIHRo
ZXkgYXJlIGJlaW5nIHdyaXR0ZW4gYnkgYSBsb2NhbCBzdG9yZSBpbnN0cnVjdGlvbi4gIElmCj4g
PiAgICBpbnN0cnVjdGlvbiBhbmQgZGF0YSBjYWNoZXMgYXJlIGtlcHQgY29oZXJlbnQgaW4gdGhp
cyB3YXksIG9yIGlmCj4gPiAgICB0aGUgbWVtb3J5IHN5c3RlbSBjb25zaXN0cyBvZiBvbmx5IHVu
Y2FjaGVkIFJBTXMsIHRoZW4ganVzdCB0aGUKPiA+ICAgIGZldGNoIHBpcGVsaW5lIG5lZWRzIHRv
IGJlIGZsdXNoZWQgYXQgYSBGRU5DRS5JLiAgWy4uXQo+ID4gCj4gPiBNbWgsIGRvZXMgdGhpcyBo
ZWxwPwo+IAo+IFF1b3RpbmcKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNh
LW1hbnVhbC9yZWxlYXNlcy9kb3dubG9hZC9SYXRpZmllZC1JTUFGRFFDL3Jpc2N2LXNwZWMtMjAx
OTEyMTMucGRmCj4gCj4gQ2hhcHRlciAzICLigJxaaWZlbmNlaeKAnSBJbnN0cnVjdGlvbi1GZXRj
aCBGZW5jZSwgVmVyc2lvbiAyLjAiCj4gCj4gIkZpcnN0LCBpdCBoYXMgYmVlbiByZWNvZ25pemVk
IHRoYXQgb24gc29tZSBzeXN0ZW1zLCBGRU5DRS5JIHdpbGwgYmUgZXhwZW5zaXZlIHRvIGltcGxl
bWVudAo+IGFuZCBhbHRlcm5hdGUgbWVjaGFuaXNtcyBhcmUgYmVpbmcgZGlzY3Vzc2VkIGluIHRo
ZSBtZW1vcnkgbW9kZWwgdGFzayBncm91cC4gSW4gcGFydGljdWxhciwKPiBmb3IgZGVzaWducyB0
aGF0IGhhdmUgYW4gaW5jb2hlcmVudCBpbnN0cnVjdGlvbiBjYWNoZSBhbmQgYW4gaW5jb2hlcmVu
dCBkYXRhIGNhY2hlLCBvciB3aGVyZQo+IHRoZSBpbnN0cnVjdGlvbiBjYWNoZSByZWZpbGwgZG9l
cyBub3Qgc25vb3AgYSBjb2hlcmVudCBkYXRhIGNhY2hlLCBib3RoIGNhY2hlcyBtdXN0IGJlIGNv
bXBsZXRlbHkKPiBmbHVzaGVkIHdoZW4gYSBGRU5DRS5JIGluc3RydWN0aW9uIGlzIGVuY291bnRl
cmVkLiBUaGlzIHByb2JsZW0gaXMgZXhhY2VyYmF0ZWQgd2hlbiB0aGVyZSBhcmUKPiBtdWx0aXBs
ZSBsZXZlbHMgb2YgSSBhbmQgRCBjYWNoZSBpbiBmcm9udCBvZiBhIHVuaWZpZWQgY2FjaGUgb3Ig
b3V0ZXIgbWVtb3J5IHN5c3RlbS4KPiAKPiBTZWNvbmQsIHRoZSBpbnN0cnVjdGlvbiBpcyBub3Qg
cG93ZXJmdWwgZW5vdWdoIHRvIG1ha2UgYXZhaWxhYmxlIGF0IHVzZXIgbGV2ZWwgaW4gYSBVbml4
LWxpa2UKPiBvcGVyYXRpbmcgc3lzdGVtIGVudmlyb25tZW50LiBUaGUgRkVOQ0UuSSBvbmx5IHN5
bmNocm9uaXplcyB0aGUgbG9jYWwgaGFydCwgYW5kIHRoZSBPUyBjYW4KPiByZXNjaGVkdWxlIHRo
ZSB1c2VyIGhhcnQgdG8gYSBkaWZmZXJlbnQgcGh5c2ljYWwgaGFydCBhZnRlciB0aGUgRkVOQ0Uu
SS4gVGhpcyB3b3VsZCByZXF1aXJlIHRoZQo+IE9TIHRvIGV4ZWN1dGUgYW4gYWRkaXRpb25hbCBG
RU5DRS5JIGFzIHBhcnQgb2YgZXZlcnkgY29udGV4dCBtaWdyYXRpb24uIEZvciB0aGlzIHJlYXNv
biwgdGhlCj4gc3RhbmRhcmQgTGludXggQUJJIGhhcyByZW1vdmVkIEZFTkNFLkkgZnJvbSB1c2Vy
LWxldmVsIGFuZCBub3cgcmVxdWlyZXMgYSBzeXN0ZW0gY2FsbCB0bwo+IG1haW50YWluIGluc3Ry
dWN0aW9uLWZldGNoIGNvaGVyZW5jZSwgd2hpY2ggYWxsb3dzIHRoZSBPUyB0byBtaW5pbWl6ZSB0
aGUgbnVtYmVyIG9mIEZFTkNFLkkKPiBleGVjdXRpb25zIHJlcXVpcmVkIG9uIGN1cnJlbnQgc3lz
dGVtcyBhbmQgcHJvdmlkZXMgZm9yd2FyZC1jb21wYXRpYmlsaXR5IHdpdGggZnV0dXJlIGltcHJv
dmVkCj4gaW5zdHJ1Y3Rpb24tZmV0Y2ggY29oZXJlbmNlIG1lY2hhbmlzbXMuCj4gCj4gRnV0dXJl
IGFwcHJvYWNoZXMgdG8gaW5zdHJ1Y3Rpb24tZmV0Y2ggY29oZXJlbmNlIHVuZGVyIGRpc2N1c3Np
b24gaW5jbHVkZSBwcm92aWRpbmcgbW9yZQo+IHJlc3RyaWN0ZWQgdmVyc2lvbnMgb2YgRkVOQ0Uu
SSB0aGF0IG9ubHkgdGFyZ2V0IGEgZ2l2ZW4gYWRkcmVzcyBzcGVjaWZpZWQgaW4gcnMxLCBhbmQv
b3IgYWxsb3dpbmcKPiBzb2Z0d2FyZSB0byB1c2UgYW4gQUJJIHRoYXQgcmVsaWVzIG9uIG1hY2hp
bmUtbW9kZSBjYWNoZS1tYWludGVuYW5jZSBvcGVyYXRpb25zLiIKPiAKPiBJIHN0YXJ0IHRvIHN1
c3BlY3QgdGhhdCBldmVuIHRoZSBwZW9wbGUgd29ya2luZyBvbiB0aGUgcmlzY3YgbWVtb3J5IG1v
ZGVsIGhhdmUgbm90aWNlZAo+IHRoYXQgbGV0dGluZyBhIHNpbmdsZSBpbnN0cnVjdGlvbiBzdWNo
IGFzIEZFTkNFLkkgdGFrZSBjYXJlIG9mIGJvdGggY2FjaGUgY29oZXJlbmN5Cj4gKmFuZCogZmx1
c2ggdGhlIGluc3RydWN0aW9uIHBpcGVsaW5lIHdpbGwgYmUgYSBwZXJmb3JtYW5jZSBib3R0bGVu
ZWNrLCBiZWNhdXNlIGl0Cj4gY2FuIG9ubHkgY2xlYXIgdGhlIHdob2xlIGluc3RydWN0aW9uIGNh
Y2hlLgo+IAo+IE90aGVyIGFyY2hpdGVjdHVyZXMgYXJlIGVpdGhlciBjYWNoZS1jb2hlcmVudCwg
b3IgaGF2ZSBjYWNoZSBmbHVzaGluZyB3aGljaCBjYW4gYmUKPiBwZXJmb3JtZWQgb24gYSByYW5n
ZSBvZiBhZGRyZXNzZXMuIFRoaXMgaXMga2VwdCBhcGFydCBmcm9tIHdoYXRldmVyIGluc3RydWN0
aW9uCj4gZmx1c2hlcyB0aGUgaW5zdHJ1Y3Rpb24gcGlwZWxpbmUgb2YgdGhlIHByb2Nlc3Nvci4K
PiAKPiBCeSBrZWVwaW5nIGluc3RydWN0aW9uIGNhY2hlIGZsdXNoaW5nIHNlcGFyYXRlIGZyb20g
aW5zdHJ1Y3Rpb24gcGlwZWxpbmUgZmx1c2gsIHdlIGNhbgo+IGxldCBtZW1iYXJyaWVyIChhbmQg
Y29udGV4dCBzd2l0Y2hlcywgaW5jbHVkaW5nIHRocmVhZCBtaWdyYXRpb24pIG9ubHkgY2FyZSBh
Ym91dCB0aGUKPiBpbnN0cnVjdGlvbiBwaXBlbGluZSBwYXJ0LCBhbmQgbGVhdmUgaW5zdHJ1Y3Rp
b24gY2FjaGUgZmx1c2ggdG8gZWl0aGVyIGEgZGVkaWNhdGVkCj4gc3lzdGVtIGNhbGwsIG9yIHRv
IHNwZWNpYWxpemVkIGluc3RydWN0aW9ucyB3aGljaCBhcmUgYXZhaWxhYmxlIGZyb20gdXNlci1t
b2RlLgo+IAo+IENvbnNpZGVyaW5nIHRoYXQgRkVOQ0UuSSBpcyBmb3JjZWQgdG8gaW52YWxpZGF0
ZSB0aGUgd2hvbGUgaS1jYWNoZSwgSSBkb24ndCB0aGluayB5b3UKPiB3aWxsIGdldCBhd2F5IHdp
dGggZXhlY3V0aW5nIGl0IGZyb20gc3dpdGNoX21tIHdpdGhvdXQgbWFraW5nIHBlcmZvcm1hbmNl
IGdvIGRvd24gdGhlCj4gZHJhaW4gb24gY2FjaGUgaW5jb2hlcmVudCBpbXBsZW1lbnRhdGlvbnMu
Cj4gCj4gSW4gbXkgb3Bpbmlvbiwgd2hhdCB3ZSB3b3VsZCBuZWVkIGZyb20gUklTQy1WIGZvciBt
ZW1iYXJyaWVyIChhbmQgY29udGV4dCBzd2l0Y2gpIGlzIGEKPiBsaWdodHdlaWdodCB2ZXJzaW9u
IG9mIEZFTkNFLkkgd2hpY2ggb25seSBmbHVzaGVzIHRoZSBpbnN0cnVjdGlvbiBwaXBlbGluZSBv
ZiB0aGUgbG9jYWwKPiBwcm9jZXNzb3IuIFRoaXMgc2hvdWxkIGlkZWFsbHkgY29tZSB3aXRoIGEg
d2F5IGZvciBhcmNoaXRlY3R1cmVzIHdpdGggaW5jb2hlcmVudCBjYWNoZXMKPiB0byBmbHVzaCB0
aGUgcmVsZXZhbnQgYWRkcmVzcyByYW5nZXMgb2YgdGhlIGktY2FjaGUgd2hpY2ggYXJlIG1vZGlm
aWVkIGJ5IGEgSklULiBUaGlzCj4gaS1jYWNoZSBmbHVzaCB3b3VsZCBub3QgYmUgcmVxdWlyZWQg
dG8gZmx1c2ggdGhlIGluc3RydWN0aW9uIHBpcGVsaW5lLCBhcyBpdCBpcyB0eXBpY2FsCj4gdG8g
YmF0Y2ggaW52YWxpZGF0aW9uIG9mIHZhcmlvdXMgYWRkcmVzcyByYW5nZXMgdG9nZXRoZXIgYW5k
IGlzc3VlIGEgc2luZ2xlIGluc3RydWN0aW9uCj4gcGlwZWxpbmUgZmx1c2ggb24gZWFjaCBDUFUg
YXQgdGhlIGVuZC4gVGhlIGktY2FjaGUgZmx1c2ggY291bGQgZWl0aGVyIGJlIGRvbmUgYnkgbmV3
Cj4gaW5zdHJ1Y3Rpb25zIGF2YWlsYWJsZSBmcm9tIHVzZXItc3BhY2UgKHNpbWlsYXIgdG8gYWFy
Y2g2NCksIG9yIHRocm91Z2ggcHJpdmlsZWdlZAo+IGluc3RydWN0aW9ucyBhdmFpbGFibGUgdGhy
b3VnaCBzeXN0ZW0gY2FsbHMgKHNpbWlsYXIgdG8gYXJtIGNhY2hlZmx1c2gpLgoKVGhhbmtzIGZv
ciB0aGUgcmVtYXJrcywgTWF0aGlldS4gIEkgdGhpbmsgaXQgd2lsbCBiZSB2ZXJ5IGhlbHBmdWwg
dG8KUklTQy1WIGFyY2hpdGVjdHMgKGFuZCBtZW1vcnkgbW9kZWwgcGVvcGxlKSB0byBoYXZlIHRo
aXMgY29udGV4dCBhbmQKcmVhc29uaW5nIHdyaXR0ZW4gZG93bi4KCiAgQW5kcmVhCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
