Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B76DCA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/3IM0kOgOKriRY9grm51Yxwd9LspbaEmYhTvD9sxVmk=; b=KJFzMcYMYQpkAFl7op6ijaK7fx
	qPwyHEIv8cvXEhKhxQv2/RnOXv+EJ5XljqJtpYzvONrgD3i/E3dvho3DxDSQP1RdhsProzKM7kef1
	w2jxBBkfr2y66b62bCDym/XsqggajiaJnZBynlWw8ZIGfhnjrWValR4griKPGTXdi9c3nd8lQoIH9
	eDbhhhR7JpsHFRmz4uF81cfIr7B0QAG1lj89oqDlvL9cT3jHVDjddv4B0R0f/XLXWUZ3pYa1CoXsp
	CaJgeKOJQfMYe5OeEwahHex5B4r6TAjY3nQ4uBj9hrQHJYw94VKwu4Zd8l734LrkI8/V5C0cAoPIr
	zOuk2PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6ps-00000005uPI-0OPA;
	Fri, 09 Oct 2026 09:24:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6pq-00000005uPB-3NMR
	for linux-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 09:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=b8CG302VixB0WKvkywXPuuW7AQv6hdXONDKAD/cyYvs=; b=MfplqZUfcTAQGnv/K/5fQagcAT
	HAc5+rhjwGfNE9TecC3XdylBB2A70SK5GLRqXuTNjUgKgotQr9urn6Isi+RARDMvcb+nHRfrGkmOS
	H1OvV4cbPp03mZTUaiqpZkMnnzGC9CcGzsojncRUh9MLZwd7VPp+Y3ASr8PMtc2QSFnaPLdCtyxq3
	y1bbTKQUh4+msAasAnmpVVjLkJ93ECihbG3qc7Ke00r1Ch3T1SD+G0cI9pawlKo7RWrxY18brzUA0
	7+krMdme0qAS3iwEhgDqHJSUdMaKPognflolSNRZCfm8zxkDA3BrkGrEqj+LeTH1adi6tpT/7bPGp
	D7NIlROA==;
Received: from out-93.mta1.migadu.com ([2001:41d0:203:375::5d] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF6pn-0000000B4V3-3cK1
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 09:24:13 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XgNkPeYW7ROgFKS71jetaL6YjpKcSR2rKTGynR4c8UY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791537847; v=1; x=1792142647;
 b=WjHHi9850EIKW/3CGwM6/YULchsfBJfkZ42QQbbAmxDyNyA+K8dvf23srl7GDGYVyKxdRgHI
 rdxYSeOr77wRbdjXLvlFU6Qqv0Nl0KtUj1O0ig2r8QAZyOkqPXC5+IxZk6N0dkG1AA7GanvaRDi
 Q5ErIOOcvoa1TuGSqMerfrfo=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bd9b3ea451def7a3;
	Fri, 09 Oct 2026 09:24:06 +0000
X-Mizu-Trace-ID: bd9b3ea451def7a3
X-Migadu-Flow: FLOW_OUT
Message-ID: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
Date: Fri, 9 Oct 2026 17:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Chen Wang <chen.wang@linux.dev>, Han Gao <gaohan@iscas.ac.cn>,
 Hangfan Li <lihangfan@iscas.ac.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Andrei Lalaev <andrey.lalaev@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_102412_010991_C596A7CF 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCB0aGlzIGR0IGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28u
CgpUaGFua3MsCgpDaGVuCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGNlZTkz
OTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzU6CgogwqAgTGludXggNy4zLXJjMSAo
MjAyNi0wOC0zMCAxMzozNDo0MCAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKIMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vbGludXguZ2l0IHRhZ3Mv
cmlzY3Ytc29waGdvLWR0LWZvci12Ny40Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
NjBlNGNhZmQzMDkwOGU3ZDhjZGZkYjRmYTFhNzRkYWJlZDlmNDdiNToKCiDCoCByaXNjdjogZHRz
OiBzb3BoZ286IHNnMjAwMi1taWxrdi1kdW8yNTZtOiBkcm9wIHJlc2VydmVkIG1lbW9yeSBub2Rl
IAooMjAyNi0xMC0wOCAwOToxMzoxNyArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVz
IGZvciB2Ny40CgpTb3BoZ286CgpGb3IgQ1YxOHh4IHNlcmlhbHM6Ci0gQWRkIGFuIG92ZXJsYXkg
dG8gZW5hYmxlIE1BQyBhbmQgTURJTyBtdWx0aXBsZXhlciB0bwogwqAgcmVhY2ggdGhlIGludGVy
bmFsIFBIWSBzbyB3ZSBjYW4gdXNlIE1pbGstViBEdW8gMjU2TQogwqAgYm9hcmQgd2l0aCBvcHRp
b25hbCBldGhlcm5ldCBpbnRlcmZhY2UuCi0gRml4IHRoZSBuYW1lIG9mIHRoZSBpbnRlcm5hbCBQ
SFkgbm9kZS4KLSBEcm9wIHJlc2VydmVkIG1lbW9yeSBub2RlLCBhbmQgbGVhdmUgRlNCTCB0byBk
ZWNpZGUKIMKgIHRoaXMgYXQgcnVudGltZS4KCkZvciBTRzIwNDI6Ci0gTGltaXQgU1BJIE5PUiB0
byAxMi41IE1Iei4KCkZvciBTRzIwNDQ6Ci0gRW5hYmxlIGJvdGggU1BJIE5PUiBjb250cm9sbGVy
cy4KClNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8Y2hlbi53YW5nQGxpbnV4LmRldj4KCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KQW5kcmVpIExhbGFldiAoMik6CiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3BoZ286IGN2MTgw
MGItbWlsa3YtZHVvOiBkcm9wIHJlc2VydmVkIG1lbW9yeSBub2RlCiDCoCDCoCDCoCByaXNjdjog
ZHRzOiBzb3BoZ286IHNnMjAwMi1taWxrdi1kdW8yNTZtOiBkcm9wIHJlc2VydmVkIG1lbW9yeSBu
b2RlCgpDaGVuLVl1IFllaCAoMik6CiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3BoZ286IGFkZCBN
aWxrLVYgRHVvIDI1Nk0gZXRoZXJuZXQgc3VwcG9ydCBvdmVybGF5CiDCoCDCoCDCoCByaXNjdjog
ZHRzOiBzb3BoZ286IGN2MTgweDogRml4IGludGVybmFsIGVwaHkgbm9kZSBuYW1lCgpIYW4gR2Fv
ICgxKToKIMKgIMKgIMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogTGltaXQgU0cyMDQyIFNQSSBOT1Ig
dG8gMTIuNSBNSHoKCkhhbmdmYW4gTGkgKDEpOgogwqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdv
OiBFbmFibGUgU1BJIE5PUiBvbiBTUkQzLTEwCgogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9NYWtlZmlsZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCAzICsrKwogwqBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLW1pbGt2LWR1by5kdHPCoCDCoHwgMTEgLS0tLS0tLS0t
LQogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzacKgIMKgIMKgIMKgIMKg
IMKgIMKgfMKgIDIgKy0KIMKgLi4uL2Jvb3QvZHRzL3NvcGhnby9zZzIwMDItbWlsa3YtZHVvMjU2
bS1ldGguZHRzb8KgIHwgMTcgKysrKysrKysrKysrKysrCiDCoC4uLi9yaXNjdi9ib290L2R0cy9z
b3BoZ28vc2cyMDAyLW1pbGt2LWR1bzI1Nm0uZHRzIHwgMTEgLS0tLS0tLS0tLQogwqBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYxLmR0c8KgIMKgIMKgIMKgfMKgIDQgKyst
LQogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYyLmR0c8KgIMKgIMKg
IMKgfMKgIDIgKy0KIMKgLi4uL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlv
bmVlci5kdHMgfMKgIDQgKystLQogwqAuLi4vYm9vdC9kdHMvc29waGdvL3NnMjA0NC1zb3BoZ28t
c3JkMy0xMC5kdHPCoCDCoCDCoCB8IDI0IAorKysrKysrKysrKysrKysrKysrKysrCiDCoDkgZmls
ZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCAKYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAyLW1pbGt2LWR1bzI1
Nm0tZXRoLmR0c28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
