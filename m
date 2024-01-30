Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CACC47DA9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/uZ3m4GAUSO5BXreASCxr5wyLqdxTmwFsf2TznzKzI=; b=Q0GCa0mtuTI5Dv
	8peZCK5/utoaMAebyC44ffeX8OBUDhIarYFXkEToxv2euF+xr2BIFr1z22GSW0+qA+h2MUGpIgQmn
	Z+bYXm/jdKZHuVc4eYzPWcFF0U1lHqRTBpGsosAKB1ZFmmGlFNXsKxT6zsrjZNH5J62Xp4x3ntANP
	CiBHWmXwzcAv9JCqox8z8g82LR37UsADaHOQ3FgU6wp/odmelEFAloTg4G7x/gIahgM8/nmYxnClQ
	HWq+mRlyM//5MTdJFw8jLPVRTf24EOAdQGy+nt0k4Iais/KPwgVJ7pYKPsWR/n8SrLilzroFRrLMr
	mw5/dRo5X4AFGO1rUbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUcU7-0000000Em4P-101U;
	Tue, 30 Jan 2024 01:00:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUcU2-0000000Em1X-3akz
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 01:00:17 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TP6Hd3Cbzz1Q8Zl;
	Tue, 30 Jan 2024 08:58:53 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 714101402CD;
	Tue, 30 Jan 2024 09:00:03 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Tue, 30 Jan 2024 09:00:02 +0800
Message-ID: <9680b0fe-9f83-4bc3-b9ba-729778b0a802@huawei.com>
Date: Tue, 30 Jan 2024 09:00:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
To: Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Pu Lehui <pulehui@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke
 Nelson <luke.r.nels@gmail.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
 <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
 <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <0b2bb6aa-e114-157b-94d1-4acb091b48b8@iogearbox.net>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_170015_286469_25D66033 
X-CRM114-Status: GOOD (  11.69  )
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

CgpPbiAyMDI0LzEvMjkgMjM6MzIsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiAxLzI5LzI0
IDEwOjEzIEFNLCBQdSBMZWh1aSB3cm90ZToKPj4gT24gMjAyNC8xLzI4IDE6MTYsIEJqw7ZybiBU
w7ZwZWwgd3JvdGU6Cj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRl
czoKPj4+Cj4+Pj4gRnJvbTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KPj4+Pgo+Pj4+
IEFkZCBuZWNlc3NhcnkgWmJiIGluc3RydWN0aW9ucyBpbnRyb2R1Y2VkIGJ5IFswXSB0byByZWR1
Y2UgY29kZSBzaXplIAo+Pj4+IGFuZAo+Pj4+IGltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgUlY2NCBK
SVQuIE1lYW53aGlsZSwgYSBydW50aW1lIGRldGV0ZWQgaGVscGVyIGlzCj4+Pj4gYWRkZWQgdG8g
Y2hlY2sgd2hldGhlciB0aGUgQ1BVIHN1cHBvcnRzIFpiYiBpbnN0cnVjdGlvbnMuCj4+Pj4KPj4+
PiBMaW5rOiAKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYml0bWFuaXAvcmVs
ZWFzZXMvZG93bmxvYWQvMS4wLjAvYml0bWFuaXAtMS4wLjAtMzgtZzg2NWU3YTcucGRmIFswXQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gwqAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIHwgMzIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCBiL2FyY2gvcmlz
Y3YvbmV0L2JwZl9qaXQuaAo+Pj4+IGluZGV4IGUzMDUwMWI0NmY4Zi4uNTFmNmQyMTQwODZmIDEw
MDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4+ICsrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXQuaAo+Pj4+IEBAIC0xOCw2ICsxOCwxMSBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgcnZjX2VuYWJsZWQodm9pZCkKPj4+PiDCoMKgwqDCoMKgIHJldHVybiBJU19FTkFCTEVE
KENPTkZJR19SSVNDVl9JU0FfQyk7Cj4+Pj4gwqAgfQo+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wg
cnZ6YmJfZW5hYmxlZCh2b2lkKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gSVNfRU5BQkxF
RChDT05GSUdfUklTQ1ZfSVNBX1pCQikgJiYgCj4+Pj4gcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtl
bHkoUklTQ1ZfSVNBX0VYVF9aQkIpOwo+Pj4KPj4+IEhtbSwgSSdtIHRoaW5raW5nIGFib3V0IHRo
ZSBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkJCKSBzZW1hbnRpY3MKPj4+IGZvciBhIGtl
cm5lbCBKSVQgY29tcGlsZXIuCj4+Pgo+Pj4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pC
QikgYWZmZWN0cyB0aGUga2VybmVsIGNvbXBpbGVyIGZsYWdzLgo+Pj4gU2hvdWxkIGl0IGJlIGVu
b3VnaCB0byBqdXN0IGhhdmUgdGhlIHJ1bi10aW1lIGNoZWNrPyBTaG91bGQgYSBrZXJuZWwKPj4+
IGJ1aWx0IHcvbyBaYmIgYmUgYWJsZSB0byBlbWl0IFpiYiBmcm9tIHRoZSBKSVQ/Cj4+Cj4+IE5v
dCBlbm91Z2gsIGJlY2F1c2UgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VY
VF9aQkIpIGlzIGEgCj4+IHBsYXRmb3JtIGNhcGFiaWxpdHkgY2hlY2ssIGFuZCB0aGUgb3RoZXIg
b25lIGlzIGEga2VybmVsIGltYWdlIAo+PiBjYXBhYmlsaXR5IGNoZWNrLiBXZSBjYW4gcGFzcyB0
aGUgY2hlY2sgCj4+IHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJC
KSB3aGVuIAo+PiBDT05GSUdfUklTQ1ZfSVNBX1pCQj1uLiBBbmQgbXkgbG9jYWwgdGVzdCBwcm92
ZSBpdC4KPiAKPiBTbyBpZiBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3RseSwgb25seSByZWx5aW5n
IG9uIHRoZSAKPiByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pCQikK
PiBwYXJ0IHdvdWxkIG5vdCB3b3JrIC0gaW93LCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1Zf
SVNBX1pCQikgaXMgCj4gbWFuZGF0b3J5IGhlcmU/Cj4gCgpZZXMsIGl0IHNob3VsZCBiZSBJU19F
TkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkJCKSAmJiAKcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtl
bHkoUklTQ1ZfSVNBX0VYVF9aQkIpLgoKPiBUaGFua3MsCj4gRGFuaWVsCj4gCj4gUC5zLjogR2l2
ZW4gQmpvcm4ncyByZXZpZXcgYW5kIHRlc3RzIEkgdG9vayB0aGUgc2VyaWVzIGludG8gYnBmLW5l
eHQgCj4gbm93LiBUaGFua3MgZXZlcnlvbmUhCgpUaGFua3MgRGFuaWVsIGFuZCBCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
