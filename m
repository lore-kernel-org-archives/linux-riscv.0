Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A2FC47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Map8XPFtd8gccmlPEEwalxlKTBPMnIp3AaXshkzjigE=; b=di5iw5je90Tca8k9VbK6GsXOew
	FfTSrIfSuyhvQ0yhLRzWTD6DwmsodPHRM6TdXgeIAWRWvWfxtcflkLjPFWeFU/lnxC0s6eBcoJCna
	Kb41U691vzsUPkkR7aasfbLZPOaipObwa8Ap9B1/MqY62HJyRWPl6doTaS3jJ+uLFdui4F+MvX7Ts
	gNSyLQtLWoTz5rB/NTzQNdWNJZIzalQ0xYKV/PSctdWqogm8drOv7NtU6rZSK6RPftmBWHPtLzy+o
	6kFokuCuecFNGnv0kWoTl8MMW0Q8ofBndIjkoJirg0+pNPdEZx+6llaev1QELujQyTTshRHBJ/kkT
	NNl97I8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTde-0000000DISL-0nOX;
	Mon, 29 Jan 2024 15:33:34 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTdU-0000000DIFH-2FkJ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ekJI84jz9Cz4AFQVBZBV9I87QpFYwV1HOZxh1PFt9/U=; b=jB4DDqb1cCAWQswNqcJfN7MjqC
	xaPle6dW5aS9NhxvIKcaBFRrDZUY1cQOzojKgUFRFnrGK4G5d/60OAGNloPPXCZZo+DF0OaA/8HgF
	JAt35RV4WNtk4XCCmM8mb+IkdHKTGQSbGX5XZGNc66bLlf31Wp8A1MLHtofuG2D9ZE/mr0h2fwTPs
	YA201eg9HpAW5vRtztivcKi27HIiZ9OBDSCGzP7aMOWKuExxmpdaU/JZhKcr9yZTOTGuEVJ64z47n
	fZQzOPdtWtbOKHYwgLlZ6veoXCVSkGGVRMvTWcQst431WbyLDIQ1UMzMIIvRYcdA2caVsPNcSC32s
	oWEy/eNg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1rUTd0-000Dvz-HP; Mon, 29 Jan 2024 16:32:54 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1rUTcz-000N5e-Ey; Mon, 29 Jan 2024 16:32:53 +0100
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
To: Pu Lehui <pulehui@huawei.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
Date: Mon, 29 Jan 2024 16:32:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27169/Mon Jan 29 10:39:53 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_073324_742422_D0462AB6 
X-CRM114-Status: GOOD (  13.76  )
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

T24gMS8yOS8yNCAxMDoxMyBBTSwgUHUgTGVodWkgd3JvdGU6Cj4gT24gMjAyNC8xLzI4IDE6MTYs
IEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNv
bT4gd3JpdGVzOgo+Pgo+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+
Cj4+PiBBZGQgbmVjZXNzYXJ5IFpiYiBpbnN0cnVjdGlvbnMgaW50cm9kdWNlZCBieSBbMF0gdG8g
cmVkdWNlIGNvZGUgc2l6ZSBhbmQKPj4+IGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgUlY2NCBKSVQu
IE1lYW53aGlsZSwgYSBydW50aW1lIGRldGV0ZWQgaGVscGVyIGlzCj4+PiBhZGRlZCB0byBjaGVj
ayB3aGV0aGVyIHRoZSBDUFUgc3VwcG9ydHMgWmJiIGluc3RydWN0aW9ucy4KPj4+Cj4+PiBMaW5r
OiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYml0bWFuaXAvcmVsZWFzZXMvZG93bmxv
YWQvMS4wLjAvYml0bWFuaXAtMS4wLjAtMzgtZzg2NWU3YTcucGRmIFswXQo+Pj4gU2lnbmVkLW9m
Zi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdC5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+
Pj4gaW5kZXggZTMwNTAxYjQ2ZjhmLi41MWY2ZDIxNDA4NmYgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0LmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+
Pj4gQEAgLTE4LDYgKzE4LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBydmNfZW5hYmxlZCh2b2lk
KQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX0MpOwo+
Pj4gwqAgfQo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBydnpiYl9lbmFibGVkKHZvaWQpCj4+PiAr
ewo+Pj4gK8KgwqDCoCByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgJiYg
cmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpOwo+Pgo+PiBIbW0s
IEknbSB0aGlua2luZyBhYm91dCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikg
c2VtYW50aWNzCj4+IGZvciBhIGtlcm5lbCBKSVQgY29tcGlsZXIuCj4+Cj4+IElTX0VOQUJMRUQo
Q09ORklHX1JJU0NWX0lTQV9aQkIpIGFmZmVjdHMgdGhlIGtlcm5lbCBjb21waWxlciBmbGFncy4K
Pj4gU2hvdWxkIGl0IGJlIGVub3VnaCB0byBqdXN0IGhhdmUgdGhlIHJ1bi10aW1lIGNoZWNrPyBT
aG91bGQgYSBrZXJuZWwKPj4gYnVpbHQgdy9vIFpiYiBiZSBhYmxlIHRvIGVtaXQgWmJiIGZyb20g
dGhlIEpJVD8KPiAKPiBOb3QgZW5vdWdoLCBiZWNhdXNlIHJpc2N2X2hhc19leHRlbnNpb25fbGlr
ZWx5KFJJU0NWX0lTQV9FWFRfWkJCKSBpcyBhIHBsYXRmb3JtIGNhcGFiaWxpdHkgY2hlY2ssIGFu
ZCB0aGUgb3RoZXIgb25lIGlzIGEga2VybmVsIGltYWdlIGNhcGFiaWxpdHkgY2hlY2suIFdlIGNh
biBwYXNzIHRoZSBjaGVjayByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhU
X1pCQikgd2hlbiBDT05GSUdfUklTQ1ZfSVNBX1pCQj1uLiBBbmQgbXkgbG9jYWwgdGVzdCBwcm92
ZSBpdC4KClNvIGlmIEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LCBvbmx5IHJlbHlpbmcgb24g
dGhlIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKQpwYXJ0IHdv
dWxkIG5vdCB3b3JrIC0gaW93LCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikg
aXMgbWFuZGF0b3J5IGhlcmU/CgpUaGFua3MsCkRhbmllbAoKUC5zLjogR2l2ZW4gQmpvcm4ncyBy
ZXZpZXcgYW5kIHRlc3RzIEkgdG9vayB0aGUgc2VyaWVzIGludG8gYnBmLW5leHQgbm93LiBUaGFu
a3MgZXZlcnlvbmUhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
