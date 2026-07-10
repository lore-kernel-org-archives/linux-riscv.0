Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7DEC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2AfNlQDJsIVK9yd02GeRrrgJi4gCoN2z/l+uX7zRRw=; b=1G8MJEuo2VyE1E
	dgAmNnFYAEr7nuFQBT7Q1REe+K+G28myy+p+aZS2pRXVDK8zNXOBo25gIFr66XC51TDMsc+AjpSO3
	/VSEY9P/8/hNgwd+ig70zThFPtab1PDBVeUDRULITywkTtWUocru9tJeQ9Vty4YTwB9fv10lYmRzZ
	BP7RcYalZsbDic4Zif6I+djmmuAnefxobcnEB0OHzOzyZUT6YopXUFlUjUgcUutbdMgsrh+aY+d2Z
	Ia4z06t0zuhYCefrFEsSm5pllyKvwnPAAaoPa1B9peeEReiX3AzIQWmi+ltRiHGhdiXhOc3bYkz3D
	te1e7yplulcAJo9UGyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7XX-00000004Zhn-0DrZ;
	Fri, 10 Jul 2026 09:28:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7XU-00000004Zg0-0qc3
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 09:28:57 +0000
X-UUID: c1107e9a7c4111f1aa26b74ffac11d73-20260710
X-CID-CACHE: Type:Local,Time:202607101718+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:af1b9d85-80da-486c-8882-358161c4481b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:cd795b6054e965ba326532fc26a42d67,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1107e9a7c4111f1aa26b74ffac11d73-20260710
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1414417490; Fri, 10 Jul 2026 17:28:47 +0800
Message-ID: <d047f823-feff-414c-b1b4-54f6ccea6b66@kylinos.cn>
Date: Fri, 10 Jul 2026 17:28:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
 <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_022856_535473_D016B8C9 
X-CRM114-Status: GOOD (  12.03  )
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

CgrlnKggMjAyNi83LzEwIDE2OjUwLCBNdWtlc2ggU2F2YWxpeWEg5YaZ6YGTOgo+Cj4KPiBPbiA3
LzEwLzIwMjYgMTI6NTEgUE0sIFBlaSBYaWFvIHdyb3RlOgo+PiBXaGVuIHRoZSBpbnRlcnJ1cHQg
c3RhdHVzIHJlZ2lzdGVyIHJlYWRzIHplcm8sIHRoZSBoYW5kbGVyIHNob3VsZAo+PiByZXR1cm4g
SVJRX05PTkUgaW5zdGVhZCBvZiBJUlFfSEFORExFRC4gV2hhdCB0aGUgcmV0dXJuIHZhbHVlCj4+
IGFjdHVhbGx5IGZlZWRzIGludG8gaXMgdGhlIHNwdXJpb3VzIGludGVycnVwdCBhY2NvdW50aW5n
IGluCj4+IG5vdGVfaW50ZXJydXB0KCk6IGZhbHNlbHkgY2xhaW1pbmcgSVJRX0hBTkRMRUQgZGVm
ZWF0cyB0aGUgImlycSBYWDoKPiBub3RlX2ludGVycnVwdCgpID8gWW91IG1lYW4gdG8gc2F5IE5v
IGludGVycnVwdCBPUiBpbnZhbGlkIGludGVycnVwdAo+IGhlcmUgPyBJIGNvdWxkIG5vdCB1bmRl
cnN0YW5kIGZ1bmN0aW9uIG5hbWUuwqAKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djcuMi1yYzEvc291cmNlL2tlcm5lbC9pcnEvc3B1cmlvdXMuYyNMMjIyCgppZih1bmxpa2VseQo8
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMi1yYzEvQy9pZGVudC91bmxpa2Vs
eT4oYWN0aW9uX3JldD09SVJRX05PTkUKPGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y3LjItcmMxL0MvaWRlbnQvSVJRX05PTkU+KSl7IC8qICogSWYKd2UgYXJlIHNlZWluZyBvbmx5
IHRoZSBvZGQgc3B1cmlvdXMgSVJRIGNhdXNlZCBieSAqIGJ1cyBhc3luY2hyb25pY2l0eQp0aGVu
IGRvbid0IGV2ZW50dWFsbHkgdHJpZ2dlciBhbiBlcnJvciwgKiBvdGhlcndpc2UgdGhlIGNvdW50
ZXIgYmVjb21lcwphIGRvb21zZGF5IHRpbWVyIGZvciBvdGhlcndpc2UgKiB3b3JraW5nIHN5c3Rl
bXMgKi8gaWYodGltZV9hZnRlcgo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcu
Mi1yYzEvQy9pZGVudC90aW1lX2FmdGVyPihqaWZmaWVzCjxodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ny4yLXJjMS9DL2lkZW50L2ppZmZpZXM+LGRlc2MtPmxhc3RfdW5oYW5kbGVk
CjxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4yLXJjMS9DL2lkZW50L2xhc3Rf
dW5oYW5kbGVkPitIWgo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMi1yYzEv
Qy9pZGVudC9IWj4vMTApKQpkZXNjLT5pcnFzX3VuaGFuZGxlZAo8aHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuMi1yYzEvQy9pZGVudC9pcnFzX3VuaGFuZGxlZD49MTsKZWxzZSBk
ZXNjLT5pcnFzX3VuaGFuZGxlZAo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcu
Mi1yYzEvQy9pZGVudC9pcnFzX3VuaGFuZGxlZD4rKzsKZGVzYy0+bGFzdF91bmhhbmRsZWQKPGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjItcmMxL0MvaWRlbnQvbGFzdF91bmhh
bmRsZWQ+PWppZmZpZXMKPGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjItcmMx
L0MvaWRlbnQvamlmZmllcz47IH0gLi4uCgppZih1bmxpa2VseQo8aHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjcuMi1yYzEvQy9pZGVudC91bmxpa2VseT4oZGVzYy0+aXJxc191bmhh
bmRsZWQKPGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjItcmMxL0MvaWRlbnQv
aXJxc191bmhhbmRsZWQ+Pjk5OTAwKSl7Ci8qICogVGhlIGludGVycnVwdCBpcyBzdHVjayAqLyBf
X3JlcG9ydF9iYWRfaXJxCjxodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4yLXJj
MS9DL2lkZW50L19fcmVwb3J0X2JhZF9pcnE+KGRlc2MsYWN0aW9uX3JldCk7Ci8qICogTm93IGtp
bGwgdGhlIElSUSAqLyBwcl9lbWVyZwo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djcuMi1yYzEvQy9pZGVudC9wcl9lbWVyZz4oIkRpc2FibGluZwpJUlEgIyVkXG4iLGlycSk7IGRl
c2MtPmlzdGF0ZQo8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMi1yYzEvQy9p
ZGVudC9pc3RhdGU+fD1JUlFTX1NQVVJJT1VTX0RJU0FCTEVECjxodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ny4yLXJjMS9DL2lkZW50L0lSUVNfU1BVUklPVVNfRElTQUJMRUQ+Owpk
ZXNjLT5kZXB0aCA8aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMi1yYzEvQy9p
ZGVudC9kZXB0aD4rKzsKaXJxX2Rpc2FibGUKPGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y3LjItcmMxL0MvaWRlbnQvaXJxX2Rpc2FibGU+KGRlc2MpIGEKc3R1Y2sgaW50ZXJydXB0
IHNvdXJjZSB3b3VsZCBjYXRjaCBoZXJlLgoKCj4+IG5vYm9keSBjYXJlZCIgZGV0ZWN0aW9uLCBz
byBhIHN0dWNrIGludGVycnVwdCBzb3VyY2Ugd291bGQgbmV2ZXIgYmUKPj4gY2F1Z2h0Lgo+Pgo+
PiBGaXhlczogNWVhNTU4NDczZmEzICgiaTJjOiBzcGFjZW1pdDogYWRkIHN1cHBvcnQgZm9yIFNw
YWNlbWlUIEsxIFNvQyIpCj4+IFNpZ25lZC1vZmYtYnk6IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3ls
aW5vcy5jbj4KPj4gLS0tCj4+IGNoYW5nbG9nIGluIHYyOgo+PiBtb2RpZnkgZ2l0bG9nIGZvciBN
b2RpZnkgdGhlIGluY29ycmVjdCBHaXQgY29tbWl0IG1lc3NhZ2UgdG8gbWF0Y2gKPj4gdGhlIHJl
YXNvbiBmb3IgdGhlIG1vZGlmaWNhdGlvbi4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtazEuYyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsx
LmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKPj4gaW5kZXggYzJkMDkwZjZiYTgwLi40
ODdmMjNmZGU3MjUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+
PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKPj4gQEAgLTcyOCw3ICs3MjgsNyBA
QCBzdGF0aWMgaXJxcmV0dXJuX3Qgc3BhY2VtaXRfaTJjX2lycV9oYW5kbGVyKGludAo+PiBpcnEs
IHZvaWQgKmRldmlkKQo+PiDCoCDCoMKgwqDCoMKgIHN0YXR1cyA9IHJlYWRsKGkyYy0+YmFzZSAr
IFNQQUNFTUlUX0lTUik7Cj4+IMKgwqDCoMKgwqAgaWYgKCFzdGF0dXMpCj4+IC3CoMKgwqDCoMKg
wqDCoCByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gSVJRX05P
TkU7Cj4+IMKgIMKgwqDCoMKgwqAgaTJjLT5zdGF0dXMgPSBzdGF0dXM7Cj4+IMKgIAo+Cj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
