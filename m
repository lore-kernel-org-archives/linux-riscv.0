Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C118AC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=od3puRF3o34YdBfm7a1QPfoL4Jck6OjMTJimLaDvU98=; b=tv/NlAkG3Was4w
	gPsOpD9j+jFVAronPELnhYamwbPenTeJwAD0NnPVmKLCZa3/orJR+I4qbL8n1tyF4DXTu1HOqoxWp
	bALSt98DAO2MMOgLIRy0ExOfzlbN7eaKHvKJCdEzUgkIlLEUby+UzcwJ3F2ze5tCjwowUdyWocXsa
	5ysYElN1/9BNFumzUL8Glb6TG2/jqu0E9Svsr6Ac9ieJd0BbXyLuj/3RCxnFacb6XQfqoTutOuVsQ
	io7COuJ7PnWWYs1kxBF69LfaseJtC9hYgvT+UlcYaRHFiSp1HizA9qAuX2DXcCAdfaxF1gR92XjsB
	+TGx5RdudmO8ePmEsW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7lj-00000004cT8-0yO0;
	Fri, 10 Jul 2026 09:43:39 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7lg-00000004cSH-28h7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 09:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XlSCz/vEAT59jkFzSKID306vJ9pfGWD/ederCXV+e7k=; b=QBNPivkfJvR+OmYd29Nkbjj/jV
	1KyUVwUeUe4MWRyLZkphhir9yDm6qQFWrJOWUo3G+CMa42XIp3F01zdS7lprbDW+/LZBT69/ndjlN
	XIkS+RqtY96lQvGJ9t40gdGeUXuJ7N+fKEsbSXeaDimwVXZ4yTqHrgVHcSan/JzDpXv2mFO7GkR0B
	I+Bx77QY6wTS6+zQVWmR7zXZruxaiJbN7HwOy6Kkejeid/Fyl6dcS4g2w3pScJbucc1s7S3uLIS+j
	JzSID6zQrNwNjImDYKoEOGHaJ2TlZYKIcWgnXkPKP2RdqeZfGCKBxx4fawAplVeMP4dGJxCaJ6hA7
	EjS2hJxg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1wi7lC-000LGw-0I;
	Fri, 10 Jul 2026 11:43:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1wi7lA-0004Rv-38;
	Fri, 10 Jul 2026 11:43:04 +0200
Message-ID: <326eda4a-39e6-4f1e-8fe5-dc1cc9ae6739@iogearbox.net>
Date: Fri, 10 Jul 2026 11:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
To: Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
 pulehui@huawei.com, martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
 <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
 <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
 <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
 <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com>
Content-Language: en-US
From: Daniel Borkmann <daniel@iogearbox.net>
Autocrypt: addr=daniel@iogearbox.net; keydata=
 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
In-Reply-To: <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/28056/Fri Jul 10 08:24:04 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_024337_009971_BF25513C 
X-CRM114-Status: GOOD (  13.64  )
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

T24gNy8xMC8yNiAyOjUzIEFNLCBQdSBMZWh1aSB3cm90ZToKPiBPbiAyMDI2LzcvMTAgMzo1MSwg
QmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gT24gVGh1LCA5IEp1bCAyMDI2IGF0IDE3OjA5LCBQdSBM
ZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyb3RlOgo+Pj4gT24gMjAyNi83LzkgMTk6
MzcsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+Pj4gU29ycnkgZm9yIHRoZSBkZWxheSBoZXJlIC0t
IHRoZSBib3QgaGFkIG1lIHRoaW5raW5nIGEgYml0Lgo+Pj4+Cj4+Pj4gT24gV2VkLCA4IEp1bCAy
MDI2IGF0IDEwOjU0LCBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyb3RlOgo+
Pj4+IC4uLgo+Pj4+Cj4+Pj4+PiBUaGlzIGFzc3VtZXMgYSBmaXhlZCBudW1iZXIgb2YgaW5zdHJ1
Y3Rpb25zIGJlZm9yZSB0aGUgdGFpbGNhbGwgZW50cnkKPj4+Pj4+IHBvaW50LiBXaGVuIGlzX3N1
YnByb2cgaXMgdHJ1ZSwgdGhlIHJ2X2FkZGkoKSBpbnN0cnVjdGlvbiBpcyBub3QgZW1pdHRlZCwK
Pj4+Pj4+IHdoaWNoIG1lYW5zIHRoZSB0YWlsY2FsbCBlbnRyeSBwb2ludCBtb3ZlcyBmb3J3YXJk
IGJ5IDQgYnl0ZXMgcmVsYXRpdmUgdG8KPj4+Pj4+IHdoZXJlIFJWX1RBSUxDQUxMX09GRlNFVCBl
eHBlY3RzIGl0IHRvIGJlLgo+Pj4+Pj4KPj4+Pj4+IFRoZSB0YWlsY2FsbCBlbnRyeSBpcyB1c2Vk
IGluIGVtaXRfYnBmX3RhaWxfY2FsbCgpIHdoZW4gY2FsY3VsYXRpbmcgdGhlCj4+Pj4+PiBqdW1w
IHRhcmdldCBmb3IgdGhlIHRhaWwgY2FsbC4gSWYgUlZfVEFJTENBTExfT0ZGU0VUIGRvZXNuJ3Qg
YWNjb3VudCBmb3IKPj4+Pj4+IHRoZSBjb25kaXRpb25hbCBlbWlzc2lvbiwgY291bGQgdGhpcyBj
YXVzZSB0aGUgd3JvbmcgZW50cnkgcG9pbnQgdG8gYmUKPj4+Pj4+IHVzZWQgd2hlbiB0YWlsIGNh
bGxpbmcgaW50byBzdWJwcm9ncmFtcz8KPj4+Pj4KPj4+Pj4gVGhpcyBpcyBub3QgYW4gaXNzdWUs
IHN1YnByb2cgY2FuIG5vdCBiZSB0aGUgdGFpbGNhbGwgY2FsbGVlLgo+Pj4+Cj4+Pj4gU2F5LCB0
aGF0IHdlIGhhdmUgYW4gZW50cnkgZnVuY3Rpb24gdGhhdCBkb2VzIGJwZl9mb3JfZWFjaF9tYXBf
YXJyYXkoKQo+Pj4+IGludG8gYSBjYWxsYmFjayBjYigpLiBjYigpIGlzIGEgc3VicHJvZ3JhbSwg
c28gbm8gaW5pdCBvZiBUQ0MuIE5vdywKPj4+PiBjYigpIGNhbGxzIGFub3RoZXIgc3VicHJvZ3Jh
bSB0aGF0IGRvZXMgYSB0YWlsY2FsbC4KPj4+Pgo+Pj4+IFRoZSBjYWxsYmFjayB0byBjYigpIGlz
IGNvbWluZyBmcm9tIHRoZSBrZXJuZWwsIHNvIGE2IGNvdWxkIGhhdmUgYmVlbgo+Pj4+IGNsb2Ji
ZXJlZCwgbm8/IFdlJ3JlIGVudGVyaW5nIGEgc3VicHJvZ3JhbSBjb21pbmcgZnJvbSB0aGUgQyBB
QkkuIE5vdywKPj4+PiBpZiB0aGUgY2FsbGJhY2sgY2FsbHMgYSBzdWJwcm9nIHRoYXQncyB0YWls
LWNhbGwgcmVhY2hhYmxlLCB0aGUgVENDCj4+Pj4gY2FuIGJlIGdhcmJhZ2U/Cj4+Pgo+Pj4gU2Fz
aGlrbyByZXBvcnRlZCB0aGUgc2FtZSBpc3N1ZSB5ZXN0ZXJkYXkuIEkgdmVyaWZpZWQgdGhhdCB0
aGUgdmVyaWZpZXIKPj4+IHJlamVjdHMgY2FzZXMgd2hlcmUgYSB0YWlsIGNhbGwgaXMgaW52b2tl
ZCB3aXRoaW4gYSBjYWxsYmFjazsKPj4+IHNwZWNpZmljYWxseSwgd2hpbGUgdGhlIGNhbGxiYWNr
J3MgcmV0dXJuIHZhbHVlIHJhbmdlIGlzIFswLCAxXSwgdGhlCj4+PiBzaW11bGF0aW9uIG9mIHRo
ZSBleGl0IHBhdGggaW4gYGNoZWNrX2hlbHBlcl9jYWxsYCAoaGFuZGxpbmcgdGhlIHRhaWwKPj4+
IGNhbGwgaGVscGVyKSBtYXJrcyBSMCBhcyBVTktOT1dOLCBjYXVzaW5nIHRoZSB2ZXJpZmllciB0
byByZWplY3QgaXTigJRzbyBJCj4+PiBkaWRuJ3QgaW52ZXN0aWdhdGUgZnVydGhlci4gSG93ZXZl
ciwgSSBqdXN0IHZlcmlmaWVkIHRoYXQgdGhlIHZlcmlmaWVyCj4+PiAqZG9lcyogYWNjZXB0IHRo
ZSBzY2VuYXJpbyB3aGVyZSBhIGNhbGxiYWNrIGNhbGxzIGEgc3VicHJvZ3JhbSwgYW5kIHRoYXQK
Pj4+IHN1YnByb2dyYW0gc3Vic2VxdWVudGx5IGNhbGxzIGEgdGFpbCBjYWxsLiBJIGJlbGlldmUg
dGhpcyBzY2VuYXJpbyBvdWdodAo+Pj4gdG8gYmUgcmVqZWN0ZWQ7IHBlcmhhcHMgc29tZSBjaGFu
Z2VzIGFyZSBuZWVkZWQgaW4gdGhlIHZlcmlmaWVyLAo+Pj4gb3RoZXJ3aXNlIHRhaWwgY2FsbHMg
b24gb3RoZXIgYXJjaGl0ZWN0dXJlcyAobGlrZSB4ODYpIHdvdWxkIGFsc28gYmUKPj4+IHN1c2Nl
cHRpYmxlIHRvIGluZmluaXRlIGxvb3AgaXNzdWVzLgo+Pgo+PiBUaGFua3MgZm9yIHRyeWluZyBp
dCBvdXQhCj4+Cj4+IE9rLCBzbyBzZWVtcyBsaWtlIHdlIG5lZWQgYSB2ZXJpZmllciBmaXggcHJl
LWxhbmRpbmc/Cj4gCj4gbWFrZSBzZW5zZSB0byBtZSwgd2lsbCB0cnkgaXQuCgpUaGFua3MsIHll
cywgcGxlYXNlIHRha2UgYSBzdGFiIGF0IGNyYWZ0aW5nIGEgdmVyaWZpZXIgZml4ICsgQlBGIHNl
bGZ0ZXN0CmFuZCBsZXQgdXMga25vdyBpZiB5b3UgYXJlIHN0dWNrIHNvbWV3aGVyZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
