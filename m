Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED49CD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZP1YtpO8m2gAjYHdfm6G6o0EqMv7POnOU4AAjdZZBU=; b=KN2hJ+WDUBmqnq
	tqDrKVPEZK47NDvHDXUyLRlOc6ZT5JNCe7njbFC/KrqPpCHG9mjyNrdhOoKRv/wqOm+ZDuuQoARjC
	eGmEXX9m5KlARBoHjTuI1dEPKK9Ufulyt7pyMPJpwoPjqeMsrEwF2hGo7RjdVHOUWp7nl6fNaX/fY
	YfpgpKoYJRQK8Iaorslytog6hFIftj554k3Z878SbR/0XkPh9rl2wavOSutV1TV1fFuS3U4c/w+Jk
	FYFO/5yCJR7jG2jJAJW1ci1Z9HRdNWFRRpgax2sg6pmLJZC6PEPcL9DWMLBhAZ4Dk8nnlSwhqaIlY
	hL9/tl8vqxJAai87G9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhDr-00000004imv-1PU1;
	Wed, 20 May 2026 13:44:31 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhDo-00000004ikv-2Mk2
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 13:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779284663; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=4tgQVUBuWqqu3Ji7uemh9M/TAjmDBv6S5gZB8+RYvGc=;
	b=vCmsrg2Y6YNYZTABqZAtbiX2BF7jC/YHW7Sj9BLuj06g4K/poNNyRODr+WeLCrLxzIEkml+0P9JtYZiMenz4IeGk59dya09sd08hFQk99zqzxntIRDJPzdke85a13TkEcoIDgdzBYQKc1DA4NEoc54IJ4HNrdCsBXfJpWSePj6E=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0X3J.yu4_1779284658;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X3J.yu4_1779284658 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 21:44:19 +0800
From: fangyu.yu@linux.alibaba.com
To: robin.murphy@arm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	sunilvl@oss.qualcomm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are described 
Date: Wed, 20 May 2026 21:44:16 +0800
Message-Id: <20260520134416.28552-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <7dc61855-d916-4659-8137-7f3457f6a56d@arm.com>
References: <7dc61855-d916-4659-8137-7f3457f6a56d@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_064428_955795_12CE2033 
X-CRM114-Status: GOOD (  17.63  )
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

Pj4+IFdvbid0IGl0IGNoYW5nZSB0aGUgRFQgYmVoYXZpb3IgYXMgaXQgZG9lc24ndCBjaGVjayBt
c2ktcGFyZW50Cj4+PiBhbnltb3JlPyAgSU9XLCBzaG91bGQgdGhpcyBiZSBtYWRlIHNwZWNpZmlj
IHRvIEFDUEkKPj4+IGJ5IGNoZWNraW5nIHdoZXRoZXIgdGhlIGRldmljZSBub2RlIGlzIGFjcGkg
bm9kZT8KPj4+Cj4+IAo+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcsIHlvdSdyZSByaWdodCB0aGF0
IHRoZSBjdXJyZW50IGNvbmRpdGlvbiB3b3VsZAo+PiBhZmZlY3QgRFQgYXMgd2VsbC4KPj4gCj4+
IE15IGFzc3VtcHRpb24gd2FzIHRoYXQgRFQgd291bGQgZGVzY3JpYmUgZWl0aGVyICJpbnRlcnJ1
cHRzIiBmb3IgV1NJCj4+IG9yICJtc2ktcGFyZW50IiBmb3IgTVNJLCBidXQgbm90IGJvdGgsIHNv
IHBsYXRmb3JtX2lycV9jb3VudCgpID4gMAo+PiB3b3VsZCBlZmZlY3RpdmVseSBpbXBseSAibm8g
bXNpLXBhcmVudCIgaW4gcHJhY3RpY2UuCj4+IAo+PiBUaGF0IHNhaWQsIEkgYWdyZWUgdGhhdCB0
aGlzIHNob3VsZCBiZSBsaW1pdGVkIHRvIHRoZSBBQ1BJIHBhdGguIFRoYXQKPj4gbWF0Y2hlcyB0
aGUgYWN0dWFsIGJ1ZyBzY29wZSDigJQgb25seSBBQ1BJIHdhcyBmYWxsaW5nIGJhY2sgdG8gTVNJ
IHdoZW4KPj4gd2lyZWQgSVJRcyB3ZXJlIGRlc2NyaWJlZCDigJQgYW5kIGxlYXZlcyBEVCB1bmNo
YW5nZWQuCj4+IAo+PiBJJ2xsIHJlc3BpbiBhIHYyIHRvIHNjb3BlIHRoZSBmaXggdG8gQUNQSSBv
bmx5LCBhbmQgdGlnaHRlbiB0aGUgY29tbWl0Cj4+IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCj4KPldo
eSB3b3VsZCB0aGlzIGJlIHNwZWNpZmljIHRvIEFDUEk/IEFGQUlDUyBpZiBEVCBzcGVjaWZpZXMg
YW4gCj4ibXNpLXBhcmVudCIgcHJvcGVydHkgc3VjaCB0aGF0IGFuIE1TSSBkb21haW4gZXhpc3Rz
LCB0aGVuIE1TSXMgd2lsbCBiZSAKPnByZWZlcnJlZCBhcyB3ZWxsLCBzaW5jZSB0aGUgZW50aXJl
IGZ1bmN0aW9uIGlzIHN0cnVjdHVyZWQgdG8gcHJlZmVyIAo+TVNJcyBpZiBhdmFpbGFibGUsIGFu
ZCBmYWxsIGJhY2sgdG8gd2lyZWQgaWYgbm90LiBJZiB0aGUgc3lzdGVtIGRvZXMgCj5zdXBwb3J0
IGJvdGggb3B0aW9ucyB0aGVuIERUIHNob3VsZCBkZXNjcmliZSB0aGF0LCBzYW1lIGFzIEFDUEk7
IHdoYXQgCj5MaW51eCBjaG9vc2VzIHRvIHVzZSBpcyBlbnRpcmVseSBMaW51eCdzIG93biBwb2xp
Y3kuCj4KPkJ1dCBpZiB5b3UgZG8gd2FudCB0byBjaGFuZ2UgdGhlIExpbnV4IGRyaXZlcidzIHBv
bGljeSBmb3Igc29tZSByZWFzb24gCj50aGF0IHRoZSBjb21taXQgbWVzc2FnZSBpc24ndCByZWFs
bHkgZXhwbGFpbmluZywgdGhlbiByZWFycmFuZ2UgdGhlIAo+d2hvbGUgc3dpdGNoIHN0YXRlbWVu
dDsgZG9uJ3QganVzdCBhZGQgYSB3ZWlyZCBoYWNrIHRvIHRyeSB0byBkZWZlYXQgdGhlIAo+ZXhp
c3RpbmcgbG9naWMgX2luIHRoZSBzYW1lIGZ1bmN0aW9uXy4uLgo+Cj5JbiBnZW5lcmFsIHRob3Vn
aCwgSSB3b3VsZCBoYXZlIHRob3VnaHQgcHJlZmVycmluZyBNU0lzIG1ha2VzIHRoZSBtb3N0IAo+
c2Vuc2UsIHNpbmNlIE1TSSB2ZWN0b3JzIGFyZSBnZW5lcmFsbHkgY2hlYXBlciB0aGFuIHdpcmVz
LCBzbyB0aGVyZSdzIGEgCj5iZXR0ZXIgY2hhbmNlIG9mIGJlaW5nIGFibGUgdG8gaGF2ZSB1bmlx
dWUgSVJRcyBwZXIgaW50ZXJydXB0IHNvdXJjZSwgCj53aGVyZWFzIHdpdGggd2lyZXMgeW91IG1h
eSBiZSBzdHVjayB3aXRoIGEgY29tYmluZWQgSVJRLgoKVGhhbmtzLCBSb2Jpbi4KClRvIGNsYXJp
ZnksIHRoZSBnb2FsIGhlcmUgaXMgbm90IHRvIGNoYW5nZSB0aGUgZ2VuZXJhbCBNU0ktdnMtV1NJ
CnByZWZlcmVuY2UgcG9saWN5LiBUaGUgYnVnIGlzIHRoYXQsIHdoZW4gdGhlIGhhcmR3YXJlIGFk
dmVydGlzZXMKSUdTPUJPVEgsIERUIGFscmVhZHkgcHJvdmlkZXMgYSB3YXkgdG8gc2VsZWN0IFdT
SSBieSBkZXNjcmliaW5nIHdpcmVkCklSUXMgd2l0aG91dCBhbiBtc2ktcGFyZW50LCBidXQgdGhl
IEFDUEkgcGF0aCBkb2VzIG5vdCBjdXJyZW50bHkgaGF2ZQphbiBlcXVpdmFsZW50IHdheSB0byBz
dGVlciB0aGUgZHJpdmVyIHRvIFdTSS4KCiAgICAtIERUOiBpZiAibXNpLXBhcmVudCIgaXMgb21p
dHRlZCwgb2ZfbXNpX2dldF9kb21haW4oKSByZXR1cm5zIE5VTEwsCiAgICAgIElHUz1CT1RIIHRo
ZW4gZmFsbHMgdGhyb3VnaCB0byB0aGUgV1NJIHBhdGgsIHNvIERUIGhhcyBhIHJlYWwga25vYgog
ICAgICAoImRvbid0IGRlc2NyaWJlIE1TSSIpIHRvIHNlbGVjdCBXU0kuCiAgICAtIEFDUEk6IHRo
ZXJlIGlzIG5vIHBlci1kZXZpY2UgZXF1aXZhbGVudC4gT24gc3lzdGVtcyB3aXRoIElNU0lDLCB0
aGUKICAgICAgSUdTPUJPVEggSU9NTVUgYWx3YXlzIGVudGVycyB0aGUgTVNJIGJyYW5jaCBhbmQg
cmVzb2x2ZXMgYSBub24tTlVMTAogICAgICBtc2lfZG9tYWluLCByZWdhcmRsZXNzIG9mIHdoYXQg
aXRzIG93biBfQ1JTIGRlc2NyaWJlcy4gVGhlIE1TSSBmYWxsYmFjawogICAgICBvbmx5IHRyaWdn
ZXJzIHdoZW4gdGhlIHN5c3RlbSBoYXMgbm8gSU1TSUMgYXQgYWxsLCB3aGljaCBpcyBhCiAgICAg
IGZpcm13YXJlLXdpZGUgZGVjaXNpb24gcmF0aGVyIHRoYW4gYSBwZXItZGV2aWNlIG9uZS4KCkFz
IGEgcmVzdWx0LCB3aXRoIEFDUEkgYW5kIElHUz1CT1RILCB0aGUgZHJpdmVyIGFsd2F5cyB1c2Vz
IE1TSSBldmVuIHdoZW4KZmlybXdhcmUgZGVzY3JpYmVzIHdpcmVkIElSUXMsIHNvIHRoZSBwbGF0
Zm9ybSBjYW5ub3QgZXhwcmVzcyB0aGUgc2FtZQppbnRlbnQgYXMgaXQgY2FuIHdpdGggRFQuCgpT
byB0aGlzIHBhdGNoIGlzIG1lYW50IHRvIGZpeCB0aGF0IEFDUEkgZ2FwIGZvciBJR1M9Qk9USCwg
bm90IHRvIG1ha2UKV1NJIGdlbmVyYWxseSBwcmVmZXJyZWQgb3ZlciBNU0kuIEkgYWdyZWUgdGhl
IGNvbW1pdCBtZXNzYWdlIHNob3VsZAptYWtlIHRoYXQgYnVnIHNjb3BlIGV4cGxpY2l0LgoKPgo+
KEFzIGEgc2lkZSBub3RlLCBpcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGlzIGNhbGxpbmcgb2ZfbXNp
X2NvbmZpZ3VyZSgpIG9uIAo+YSBwbGF0Zm9ybSBkZXZpY2Ugd2hlbiBvZl9wbGF0Zm9ybV9kZXZp
Y2VfY3JlYXRlX3BkYXRhKCkgd2lsbCBoYXZlIGRvbmUgCj50aGF0IGFscmVhZHk/KQoKR29vZCBj
YXRjaCwgYWdyZWVkLgoKVGhhbmtzLApGYW5neXUKCj4KPlRoYW5rcywKPlJvYmluLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
