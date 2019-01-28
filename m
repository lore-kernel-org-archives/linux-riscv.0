Return-Path: <SRS0=ZHC4=QE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FD0C282C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 16:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A33A2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Jan 2019 16:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSYzRnpS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A33A2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DD/q9IMJbRCKUokmKNLIbfzZBgXQLT7gIm+eI6zJYwQ=; b=dSYzRnpSP05zFa7XchGD8LcHn
	ibwuLd/8tJWAhcnAWsaS+wQZ6JkDATrkgb02a/ha2NK5SDCsCzkYgPB6ec12eix1OVRw7x9cNtru1
	kX1dkDTY29O1Xnb4df/Njww/2zjRRBaKQZ6bRt5Yilgzeq+mjFQW7LhY7vaIMwg7ubR7j8K/pB/0P
	K6aC41WZsxhUsdnbAjmuxE056vNvQ4HW689elWZnhCV+qIcYKq5itSa4QEvqX7KKFIG+8to39E4MO
	GZ07qjPkA1x0zBnBbSV56K7GBD1JyUNqLWxiwoHgO1oSE1cMWDPOTH79oo56M8xN0rknixr1jD1bn
	nGO01KBCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goA4v-0003k1-GX; Mon, 28 Jan 2019 16:48:09 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goA4r-0003je-Tx
 for linux-riscv@lists.infradead.org; Mon, 28 Jan 2019 16:48:07 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x0SGlHHn031709; Mon, 28 Jan 2019 16:47:19 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-08-5c4f32149ef5
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 C6.FC.09052.4123F4C5; Mon, 28 Jan 2019 18:47:16 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x0SGlFjA012409; Mon, 28 Jan 2019 18:47:15 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 28 Jan 2019 18:47:15 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Alexander Graf <agraf@suse.de>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <033872b8-49d5-2731-118f-967488f4763f@suse.de>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <7efecac7-17bd-5fc1-d0de-9fd498db4751@wdc.com>
 <d476c0e2b525fb0642b3155a247495cb1850c208.camel@kernel.crashing.org>
 <452be0d3-da8e-643e-9f91-c38f0af36ffd@suse.de>
 <CAPweEDwdByUTHnbKGS-LbwGzqsjjWciWOBnPOKkNqupY--vV2A@mail.gmail.com>
 <033872b8-49d5-2731-118f-967488f4763f@suse.de>
Message-ID: <cbccd2dd56e1e5b498fd12abda22b863@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsXSHc2orCtq5B9j8KOB1eJhzx0mixNX/jFa
 bFuymtVi5+4XrBZbbsdYtHx4x2qxaMV3FosPTa3MFq3t35gsTk9YxGSx7XMLm8XpNwuYLJZe
 v8hk0fzuHLvFzq47rBabJyxgtWibxW+x6WCaxfYX/WwWz1f2sjmIeOw5PYvZY828NYweU3+f
 YfHYOesuu8fMVw+ZPHbtamT3eLjpEpPH5hVaHj1vWlg9Ni+p93h//Tebx6Xm6+wem09Xe7Qf
 6GYK4IvisklJzcksSy3St0vgylh38DhzQR9vxZW5R5kbGE9ydTFyckgImEi8ebWEuYuRi0NI
 4DCjxOJnM5kgnEOMEpNfHWGBqDKVmL23kxHE5hUQlDg58wlYnFnAQmLqlf2MELa8RPPW2UCT
 ODhYBFQlPjwzBgmzCWhKzL90EKxcREBJ4s7GO2DzmQX+s0r8WTMRLCEsoC8x5fMhVhCbX0BY
 4tPdi2A2p4C1xONf79kgDnrNInHz0TdWiCNcJD7NWswOcZyKxIffD8BsUQFliRcnprNOYBSa
 heTWWUhunYXk1gWMzKsYBRLLjPUyk4v10vKLSjL00os2MYIjfK7vDsZzC+wPMQpwMCrx8HZw
 +McIsSaWFVfmAkOGg1lJhHfqdb8YId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryHX4QHCQmkJ5ak
 ZqemFqQWwWSZODilGhjjUz9setd1/jzHgZ1rioqZzAsvhCyeW5JsZOSisaY9UKVB7fHZtT0V
 sUf2q3xg6HbuXuIZk5ulwSZR+3P+1pWFFw8nzjMozzfg/rTjp27p0vMKbncZ5+x3CHa/2Oph
 1fJIbKLwxvR49Zv7pDJLHspxiGdOmfypQEP2kbNcfkRc/+rf/+ZySCqxFGckGmoxFxUnAgBv
 cmfJ7AIAAA==
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Mon, 28 Jan 2019 16:47:19 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Mon, 28 Jan 2019 16:47:19 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_084806_341572_DF1BAA63 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Atish Patra <atish.patra@wdc.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@sifive.com>, zong@andestech.com,
 ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 mick@ics.forth.gr, Alistair Francis <Alistair.Francis@wdc.com>,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMS0yOCAxODozOCwgQWxleGFuZGVyIEdyYWYgzq3Os8+BzrHPiM61Ogo+
IE9uIDI4LjAxLjE5IDE3OjMzLCBMdWtlIEtlbm5ldGggQ2Fzc29uIExlaWdodG9uIHdyb3RlOgo+
PiAtLS0KPj4gY3Jvd2QtZnVuZGVkIGVjby1jb25zY2lvdXMgaGFyZHdhcmU6IAo+PiBodHRwczov
L3d3dy5jcm93ZHN1cHBseS5jb20vZW9tYTY4Cj4+IAo+PiBPbiBNb24sIEphbiAyOCwgMjAxOSBh
dCAxMjo0NCBQTSBBbGV4YW5kZXIgR3JhZiA8YWdyYWZAc3VzZS5kZT4gd3JvdGU6Cj4+IAo+Pj4+
IElmIFJpc2MtViB3YW50cyB0byBhdm9pZCBmcmFnbWVudGF0aW9uLCBpdCBzaG91bGQgc2ltcGx5
IGtlZXAgYSAKPj4+PiBmaXJtZXIKPj4+PiByZWlnbiBpbiB3aGF0IGlzIGFsbG93ZWQgaW4gYW4g
aW1wbGVtZW50YXRpb24gYW5kIGtlZXAgYSBsaWQgb24gc3VjaAo+Pj4+IGhvcnJpZCBpZGVhcyBh
cyB2ZW5kb3Igc3BlY2lmaWMgdXNlcnNwYWNlIElTQSBleHRlbnNpb25zLgo+Pj4gCj4+PiBJIHRl
bmQgdG8gYWdyZWUgaGVyZS4gSSB0aGluayBhIGdsb2JhbCBpZGVudGlmaWNhdGlvbiBzY2hlbWUg
aXMKPj4+IHJlYXNvbmFibGUuIEJ1dCBjYW4ndCB3ZSBqdXN0IGxpdmUgd2l0aCBhIHNpbmdsZSBn
bG9iYWwgc3BlYyB0aGF0IAo+Pj4gcGVvcGxlCj4+PiBjb250cmlidXRlIHRvPwo+PiAKPj4gIHVu
Zm9ydHVuYXRlbHksIGFsZXhhbmRlciwgdGhlIFJJU0MtViBGb3VuZGF0aW9uIGhhcyBjaG9zZW4g
dG8gZXhjbHVkZQo+PiBwZW9wbGUgZnJvbSB0aGUgZGlzY3Vzc2lvbiwgYnkgY2hvb3NpbmcgYW4g
SVRVLXN0eWxlICgiQ2FydGVsbGVkIikKPj4gc2VjcmV0aXZlIHN0YW5kYXJkcyBkZXZlbG9wbWVu
dCBwcm9jZXNzLgo+PiAKPj4gIHNvIGFzIGFuICJvdXRzaWRlciIgd2hvIGZvciB3aGF0ZXZlciBy
ZWFzb24gY2Fubm90IGpvaW4gdGhhdCBjbG9zZWQsCj4+IHNlY3JldGl2ZSBwcm9jZXNzIChmb3Ig
ZXhhbXBsZSBhIHN0cmF0ZWdpY2FsbHktY3JpdGljYWwgdS1ib290IG9yCj4+IGxpbnV4IGtlcm5l
bCBkZXZlbG9wZXIgd2l0aCBkZWNhZGVzIG9mIHJlbGV2YW50IGV4cGVyaWVuY2UgYnV0IHdobyBp
cwo+PiB1bmRlciBjb250cmFjdCkgZXZlbiBpZiB5b3Ugd2FudGVkIHRvIGNvbnRyaWJ1dGUgdG8g
YSBzaW5nbGUgZ2xvYmFsCj4+IHNwZWMsIHlvdSBjYW4ndC4KPj4gCj4+ICB0aGUgcmVhc29ucyB3
aHkgdGhlIElUVS1zdHlsZSBDYXJ0ZWwgd2FzIHNldCB1cCBoYXZlIGJlZW4gZGlzY3Vzc2VkCj4+
IGFuZCBtYWRlIGNsZWFyIChwYXRlbnRzKTsgdGhlIGp1c3RpZmljYXRpb25zIHdlcmUga25vY2tl
ZCBkb3duOyB0aGVyZQo+PiB3YXMgbm8gcmVzcG9uc2UuCj4gCj4gSSBjYW4gc2VlIHdoeSB5b3Ug
d2FudCB0byBoYXZlIGEgcHJvY2VzcyBsaWtlIHRoYXQgaW4gcGxhY2UgZm9yIHRoZSBJU0EKPiBp
dHNlbGYsIGJ1dCB0aGUgU0JJIHNwZWMgcmVhbGx5IHNob3VsZCBub3QgaGF2ZSBhbnl0aGluZyAi
aW5ub3ZhdGl2ZSIgCj4gb3IKPiBwYXRlbnRhYmxlLiBBdCB0aGUgZW5kIG9mIHRoZSBkYXksIGl0
J3MgYSBjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KPiAKPiAKPiBBbGV4CgpGWUkKaHR0cHM6Ly9m
b3NkZW0ub3JnLzIwMTkvc2NoZWR1bGUvZXZlbnQvcmlzY3ZzYmkvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
