Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01428C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lW1DRCn+UQKm6/10sj01KlbM9rcKcCgLtBG1HLoRbzg=; b=dsbC8yiuAu7Xc7hJN1ULWRUpLr
	LB4zvZ5ZlYzRG58mOAVyVZ2HtJWMPHPAnjAhlJ4t8vUI+QpwV0R9n8Hd/OuWnm2sO6S26/Um8Vfek
	paMAgbKpRpz5VJ+Qk1nQ88htxa6NzdjAB/G9Jkk3vqQ9E5jHI9Nb/PDeqEdkQpsLuJECgGk8YrKrG
	fw/DRv+4c1c2d8MfHu2N3K2qy3+9Rbxko6NwaZOc6W+AE1F4+5+r7ZI0P47KpoVH5wefCp6T+8xhf
	Y3xVkaXaKwfsw7nQMirC7W/kcuiBJfTyhRAZIo7YdVoT5P2MpD2PHqAddRAujUl3m+VIhIAa4WW6B
	WlPJq9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfmWL-00DMSq-7E; Sat, 16 Apr 2022 17:47:41 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfmWH-00DMSQ-N3
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 17:47:39 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DD21D320100E;
 Sat, 16 Apr 2022 13:47:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 16 Apr 2022 13:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1650131251; x=
 1650217651; bh=QzHqO3qBPfISWOnlbh83TMK3WpZoHmvC2YIjH+rKF78=; b=X
 qYFGHB+RVrC494RYE04j3twORzmRPRWHFHmUNtG/F3S7lKlXwbg8y3rlKsc/HgMH
 nTCT45Jjk201BGpPWmaEI/nasFGalXwPA3SJH9d/udRj7S3WHunnPkeeNBVJvc6n
 iuFt2IICMx+g7xwOI2Oxs1Ur6l/VYS2yT5WFFAAaY1iIvmftFP7H99hIpNJiwWra
 cVLd13xCyjY3d7hovH3XtR4j8R91tiAK5vObr4WWCMe7WdKTiVFZ744b7oS4vg6G
 hmxTCcAsSlObAZF7bQ06hhWsX3ES7VkHDGzb5c1tB38E2Z5PnZqa8bqI/MBot1RL
 alD2gAiS8TvWSFjCvyZuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650131251; x=1650217651; bh=QzHqO3qBPfISW
 Onlbh83TMK3WpZoHmvC2YIjH+rKF78=; b=t3hTVxaxhK+qcHEB+DRYNqb8Dg3zu
 JjSpBrAVuTDqxFqWDvZdEhLXeMieAVeOZ/cR0w9eO9Zk03ewwb7tFf0BrkrbrJBH
 x0dthUc46+ftxYA6UgjFD6CqmnGc+ClVYuHjLrbXaW/Ikbk5s1tBuf5+VJaa0tNP
 Sejgd42AJJBhq4IifIIBLVESfFF3pxckG74YiHb5ZWXR8DMToewv3khBBhP2ds75
 VS12elzJ/K4BZVqkDR5+gML1pteEe+dbC5eL6DiDcWVM3VYQwdVciozQFokwJu1d
 tKpbivZ+VVKcOd6dz/l6f8yF48w3CsvioUenJ2XKlJMDGSeu7eAPblVMw==
X-ME-Sender: <xms:MgFbYnQSnsFiCpK8yrPGMEu22Tg86COCm56Xq5uoaCxzCT8PFfYBoA>
 <xme:MgFbYowvyFe7Sp-fj8j_dXjiYZ9r429dkc_zT-fXWf_lPr6pQItfDTMYsLVPtisot
 jSDl-_w8_YzV2Wwhg>
X-ME-Received: <xmr:MgFbYs1eZG8-osXH3PG48gEWvwwXw5BrrBw-gOi_WrhjGIdDx5W-y4t4NVm7oE9neilVmpYumx6iUw83O5gGVjwryd14IGR2WO7j3-Ee5rq7_c3v12urBULNlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeljedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
 uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
 ggtffrrghtthgvrhhnpeduvdelffekjefhudeileehjeetheelfeeiieekgfetueeghfdt
 veekfeevgfehieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
 rghnugdrohhrgh
X-ME-Proxy: <xmx:MgFbYnD3xwpEQVkZ6-Uvq23JIMkjoaoA91tUW_gHXh2AaUigocCwVw>
 <xmx:MgFbYgi_9rZ-BaEb2caweWEPcw_ctH05v_UCHBEVoo4PeaNww12b3w>
 <xmx:MgFbYroi9yKuzJhO7BAOjsr-u2g8S0kU-9qH-pR6qRx6nrJxcARCJw>
 <xmx:MwFbYvpX44nV_uY4dVEDK-kF3jxlOSmUOnegGv2pbKhal3n1vzqXTw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Apr 2022 13:47:29 -0400 (EDT)
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
 <YlpxsYREWv/LQ+HY@Red>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <849a3728-7e84-4f26-0c73-4d68eae9ae01@sholland.org>
Date: Sat, 16 Apr 2022 12:47:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <YlpxsYREWv/LQ+HY@Red>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_104738_237060_ED03F3BE 
X-CRM114-Status: GOOD (  15.46  )
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

T24gNC8xNi8yMiAyOjM1IEFNLCBDb3JlbnRpbiBMYWJiZSB3cm90ZToKPiBMZSBGcmksIEFwciAx
NSwgMjAyMiBhdCAwOToxOToyM1BNIC0wNTAwLCBTYW11ZWwgSG9sbGFuZCBhIMOpY3JpdCA6Cj4+
IE9uIDQvMTUvMjIgNjoyNiBBTSwgQ29yZW50aW4gTGFiYmUgd3JvdGU6Cj4+PiBMZSBNb24sIE1h
ciAwNywgMjAyMiBhdCAxMTo0NjoxOFBNICswMTAwLCBIZWlrbyBTdHVlYm5lciBhIMOpY3JpdCA6
Cj4+Pj4gVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGFsdGVybmF0aXZlcyBjaGFuZ2VzIGRv
bmUgaW4gbXkgc3ZwYm10IHNlcmllcwo+Pj4+IGFuZCB0aHVzIGFsc28gZGVwZW5kcyBvbiBBdGlz
aCdzIGlzYS1leHRlbnNpb24gcGFyc2luZyBzZXJpZXMuCj4+Pj4KPj4+PiBJdCBpbXBsZW1lbnRz
IHVzaW5nIHRoZSBjYWNoZS1tYW5hZ2VtZW50IGluc3RydWN0aW9ucyBmcm9tIHRoZSAgWmljYm9t
LQo+Pj4+IGV4dGVuc2lvbiB0byBoYW5kbGUgY2FjaGUgZmx1c2gsIGV0YyBhY3Rpb25zIG9uIHBs
YXRmb3JtcyBuZWVkaW5nIHRoZW0uCj4+Pj4KPj4+PiBTb0NzIHVzaW5nIGNwdSBjb3JlcyBmcm9t
IFQtSGVhZCBsaWtlIHRoZSBBbGx3aW5uZSBEMSBpbXBsZW1lbnQgYQo+Pj4+IGRpZmZlcmVudCBz
ZXQgb2YgY2FjaGUgaW5zdHJ1Y3Rpb25zLiBCdXQgd2hpbGUgdGhleSBhcmUgZGlmZmVyZW50LAo+
Pj4+IGluc3RydWN0aW9ucyB0aGV5IHByb3ZpZGUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSwgc28g
YSB2YXJpYW50IGNhbgo+Pj4+IGVhc2x5IGhvb2sgaW50byB0aGUgZXhpc3RpbmcgYWx0ZXJuYXRp
dmVzIG1lY2hhbmlzbSBvbiB0aG9zZS4KPj4+Pgo+Pj4+Cj4+Pgo+Pj4gSGVsbG8KPj4+Cj4+PiBJ
IGFtIHRlc3RpbmcgaHR0cHM6Ly9naXRodWIuY29tL3NtYWV1bC9saW51eC5naXQgYnJhbmNoOm9y
aWdpbi9yaXNjdi9kMS13aXAgd2hpY2ggY29udGFpbiB0aGlzIHNlcmllLgo+Pj4KPj4+IEkgYW0g
aGl0dGluZyBhIGJ1ZmZlciBjb3JydXB0aW9uIHByb2JsZW0gd2l0aCBETUEuCj4+PiBUaGUgc3Vu
OGktY2UgY3J5cHRvIGRyaXZlciBmYWlsIHNlbGYgdGVzdHMgZHVlIHRvICJkZXZpY2Ugb3ZlcnJh
biBkZXN0aW5hdGlvbiBidWZmZXIiLgo+Pj4gSW4gZmFjdCB0aGUgYnVmZmVyIGlzIG5vdCBvdmVy
cmFuIGJ5IGRldmljZSBidXQgYnkgZG1hX21hcF9zaW5nbGUoKSBvcGVyYXRpb24uCj4+Pgo+Pj4g
VGhlIGZvbGxvd2luZyBzbWFsbCBjb2RlIHNob3cgdGhlIHByb2JsZW06Cj4+Pgo+Pj4gZG1hX2Fk
ZHJfdCBkbWE7Cj4+PiB1OCAqYnVmOwo+Pj4gI2RlZmluZSBCU0laRSAyMDQ4Cj4+PiAjZGVmaW5l
IERNQVNJWkUgMTYKPj4+Cj4+PiBidWYgPSBrbWFsbG9jKEJTSVpFLCBHRlBfS0VSTkVMIHwgR0ZQ
X0RNQSk7Cj4+PiBmb3IgKGkgPSAwOyBpIDwgQlNJWkU7IGkrKykKPj4+ICAgICBidWZbaV0gPSAw
eEZFOwo+Pj4gcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZPLCAiRE1BVEVTVDE6IiwgRFVNUF9QUkVG
SVhfTk9ORSwgMTYsIDQsIGJ1ZiwgMjU2LCBmYWxzZSk7Cj4+PiBkbWEgPSBkbWFfbWFwX3Npbmds
ZShjZS0+ZGV2LCBidWYsIERNQVNJWkUsIERNQV9GUk9NX0RFVklDRSk7Cj4+Cj4+IFRoaXMgZnVu
Y3Rpb24gKHRocm91Z2ggZG1hX2RpcmVjdF9tYXBfcGFnZSgpKSBlbmRzIHVwIGNhbGxpbmcKPj4g
YXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKC4uLiwgLi4uLCBETUFfRlJPTV9ERVZJQ0UpLCB3aGlj
aCBpbnZhbGlkYXRlcyB0aGUgQ1BVJ3MKPj4gY2FjaGUuIFRoaXMgaXMgdGhlIHNhbWUgdGhpbmcg
b3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyAoYXQgbGVhc3QgYXJtLCBhcm02NCwKPj4gb3BlbnJpc2Ms
IGFuZCBwb3dlcnBjKS4gU28gdGhpcyBhcHBlYXJzIHRvIGJlIHdvcmtpbmcgYXMgaW50ZW5kZWQu
Cj4gCj4gVGhpcyBiZWhhdm91ciBpcyBub3QgcHJlc2VudCBhdCBsZWFzdCBvbiBBUk0gYW5kIEFS
TTY0Lgo+IFRoZSBzYW1wbGUgY29kZSBJIHByb3ZpZGVkIGRvZXMgbm90IGNvcnJ1cHQgdGhlIGJ1
ZmZlciBvbiB0aGVtLgoKVGhhdCBjYW4gYmUgZXhwbGFpbmVkIGJ5IHRoZSAweEZFIGJ5dGVzIGhh
dmluZyBiZWVuIGZsdXNoZWQgdG8gRFJBTSBhbHJlYWR5IGluCnlvdXIgQVJNL0FSTTY0IHRlc3Rz
LCB3aGVyZWFzIGluIHlvdXIgcmlzY3Y2NCBjYXNlLCB0aGUgMHhGRSBieXRlcyB3ZXJlIHN0aWxs
IGluCmEgZGlydHkgY2FjaGUgbGluZS4gVGhlIGNhY2hlIHRvcG9sb2d5IGFuZCBpbXBsZW1lbnRh
dGlvbiBpcyB0b3RhbGx5IGRpZmZlcmVudAphY3Jvc3MgdGhlIFNvQ3MsIHNvIHRoaXMgaXMgbm90
IHRvbyBzdXJwcmlzaW5nLgoKU2VtYW50aWNhbGx5LCBkbWFfbWFwX3NpbmdsZSguLi4sIERNQV9G
Uk9NX0RFVklDRSkgbWVhbnMgeW91IGFyZSBkb2luZyBhCnVuaWRpcmVjdGlvbmFsIERNQSB0cmFu
c2ZlciBmcm9tIHRoZSBkZXZpY2UgaW50byB0aGF0IGJ1ZmZlci4gU28gdGhlIGNvbnRlbnRzIG9m
CnRoZSBidWZmZXIgYXJlICJ1bmRlZmluZWQiIHVudGlsIHRoZSBETUEgdHJhbnNmZXIgY29tcGxl
dGVzLiBJZiB5b3UgYXJlIGFsc28Kd3JpdGluZyBkYXRhIGludG8gdGhlIGJ1ZmZlciBmcm9tIHRo
ZSBDUFUgc2lkZSwgdGhlbiB5b3UgbmVlZCBETUFfQklESVJFQ1RJT05BTC4KClJlZ2FyZHMsClNh
bXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
