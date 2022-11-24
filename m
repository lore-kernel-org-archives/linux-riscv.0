Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD191C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeqtGqz+0XnVN3dkcpXpLLKn9Z6nGPhf/+H1xkRue0I=; b=smFFAQnv/ZWveb
	L5qxl22NO8Lv6dFzKPxB4MNv7XIdskuHVZVjWkqdBDT8e6Wk3AD+ltpZiWhRTfq3ghwbFGdMq1CEz
	fpOJVSqSQCqTyRUVDeM6p1IRSapyN3SqK6JJM4wiROswAxiNON+7hoK17LDO44gUbIk4q2J/orv29
	zVPNlhPGHS+crP+5IHfphIeR6y7Mbd1b29JRBAnnh+6GHn0IhjxEDRHiivlFBpLUrI6RVXb7AwsRE
	gAeYViXNzmZocWGI/gxQW43E9e5AKnUoLUI7nV5IW1XvALl3+hK7C9WVAdgDxRGs5/iopl/V7O74Y
	tFjnLW7OkRF7Il3FWHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIWK-00BP93-3a; Thu, 24 Nov 2022 20:08:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyIWG-00BP85-Qz
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 20:08:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32203621C6;
	Thu, 24 Nov 2022 20:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574CCC433C1;
	Thu, 24 Nov 2022 20:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669320503;
	bh=AqLjRFqgqFhAgmvM5lie1bZYceUKkJ7UwUOqCB9iVZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P3nMtMWlZuX5SPCqYo2kFm+B0/R9GR4ITfmHWgL233xsH9u+2PvPwumnn2cjhzx1m
	 HYFG4vLV+fviFu2mEbWxIAiK+Jfea0OMphXT5Ydq/LVCFMYqd2QOH7ZdXCO0OjWzHn
	 lZCFQ6xtJQU6uJvEnYmq89DM1183CtuA79vWRQroo5QqpEPFWRL4BzXVVVtAYBrrp1
	 UMpTUtb340YKML8G+exn5jMZ6EP5KJt3pLz9PbVdUV0cq9A2SrcHBi4yZKJ0b6zh5D
	 XuAtgM+LvXhgTnlRTDbJnr6jAU8Q24fANiB3gFPvnCMT57u0tNtVSfQ2HbRbFmXlFl
	 aL/yUGKs1mb9w==
Message-ID: <59aea5e5-25f1-de8c-9982-5db226f8bda5@kernel.org>
Date: Thu, 24 Nov 2022 20:08:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
To: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor
 <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/LgZkR1hkblJ8D@spud> <4801607.MHq7AAxBmi@diego> <Y3/OlKI1jyi0eoCJ@spud>
Content-Language: en-US
From: Conor Dooley <conor@kernel.org>
In-Reply-To: <Y3/OlKI1jyi0eoCJ@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_120824_966005_BB10B647 
X-CRM114-Status: GOOD (  26.47  )
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

T24gMjQvMTEvMjAyMiAyMDowNSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQo+IAo+IE9uIFRodSwgTm92IDI0LCAyMDIyIGF0IDA4OjU4OjQx
UE0gKzAxMDAsIEhlaWtvIFN0w7xibmVyIHdyb3RlOgo+PiBBbSBEb25uZXJzdGFnLCAyNC4gTm92
ZW1iZXIgMjAyMiwgMjA6NTI6MzMgQ0VUIHNjaHJpZWIgQ29ub3IgRG9vbGV5Ogo+Pj4gT24gVGh1
LCBOb3YgMjQsIDIwMjIgYXQgMDU6MjI6MDFQTSArMDAwMCwgUHJhYmhha2FyIHdyb3RlOgo+Pj4+
IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4KPj4+Pgo+Pj4+IEludHJvZHVjZSBBTFRFUk5BVElWRV8zKCkgbWFjcm8uCj4+Pgo+Pj4g
Qml0IHBlcmZ1bmN0b3J5IEkgdGhpbmshIFRoZXJlJ3MgYSBsb3ZlbHkgY29tbWVudCBkb3duIGJl
bG93IHRoYXQgd291bGQKPj4+IG1ha2UgZm9yIGEgYmV0dGVyIGNvbW1pdCBtZXNzYWdlIGlmIHlv
dSB3ZXJlIHRvIHlvaW5rIGl0Lgo+Pj4gQ29udGVudCBsb29rcyBhYm91dCB3aGF0IEknZCBleHBl
Y3QgdG8gc2VlIHRob3VnaC4KPj4KPj4gQWxzbyBib3RoIHRoZSBjb21tZW50IG9uIHRoZSBvcmln
aW5hbCBBTFRFUk5BVElWRV8yIGFuZCB0aGUgbmV3IEFMVEVSTkFUSVZFXzMKPj4gc2hvdWxkIHBy
b2JhYmx5IGJlIG1lcmdlZCBpbnRvIGEgc2luZ2xlIGNvbW1lbnQgZXhwbGFpbmluZyB0aGlzIG9u
Y2UgZm9yIGFsbAo+PiBBTFRFUk5BVElWRV94IHZhcmlhbnRzLgo+Pgo+PiBFc3BlY2lhbGx5IHdp
dGggdGhlIGRtYSBzdHVmZiwgSSdtIHByZXR0eSBzdXJlIHdlJ2xsIGdldCBhdCBsZWFzdCBhbiBB
TFRFUk5BVElWRV80Cj4+IGlmIG5vdCBldmVuIG1vcmUgOy0pIC4gU28gd2UgZGVmbml0bHkgZG9u
J3Qgd2FudCB0byByZXBlYXQgdGhpcyBtdWx0aXBsZSB0aW1lcy4KPiAKPiBPaCBJIGNhbiBwcm9t
aXNlIHlvdSB0aGF0IHRoZXJlJ2xsIGJlIGEgIzQgOykgSSBkbyBmaW5kIHRoZSBjb21tZW50J3MK
PiB3b3JkaW5nIHRvIGJlIHF1aXRlIG9kZCB0aG91Z2guLgo+IAo+PiArICogQSB2ZW5kb3Igd2Fu
dHMgdG8gcmVwbGFjZSBhbiBvbGRfY29udGVudCwgYnV0IGFub3RoZXIgdmVuZG9yIGhhcyB1c2Vk
Cj4+ICsgKiBBTFRFUk5BVElWRV8yKCkgdG8gcGF0Y2ggaXRzIGN1c3RvbWl6ZWQgY29udGVudCBh
dCB0aGUgc2FtZSBsb2NhdGlvbi4gSW4KPiAKPiBJbiBwYXJ0aWN1bGFyIHRoaXMgYml0IGFib3V0
ICJhdCB0aGUgc2FtZSBsb2NhdGlvbiIgZG9lcyBub3QgbWFrZSBhbGwKPiB0aGF0IG11Y2ggc2Vu
c2UuIFdoYXQgImF0IHRoZSBzYW1lIGxvY2F0aW9uIiBtZWFucyBpbiB0aGlzIGNvbnRleHQKPiBz
aG91bGQgYmUgZXhwYW5kZWQgb24gaW1vLiBFZmZlY3RpdmVseSBpdCBib2lscyBkb3duIHRvIHNv
bWVvbmUgZWxzZSBpcwo+IGFscmVhZHkgcmVwbGFjaW5nIHRoZSBzYW1lIHRoaW5ncyB5b3Ugd2Fu
dCB0byByZXBsYWNlIC0gaXQncyBqdXN0IHRoZQo+IHdvcmQgImxvY2F0aW9uIiB0aGF0IG1pZ2h0
IG1ha2Ugc2Vuc2UgaWYgeW91J3JlIGFuIG9sZCBoYW5kIGJ1dCBub3QKPiBvdGhlcndpc2U/CgpP
ciBtYXliZSBJIGFtIGp1c3QgYmlhc2VkIGJlY2F1c2UgSSB0cmllZCB0byBleHBsYWluIHRoaXMg
dG8gc29tZW9uZQpyZWNlbnRseSBhbmQgdGhlIGxhbmd1YWdlIGluIHRoZSBjb21tZW50cyBkaWRu
J3QgbWFrZSBzZW5zZSB0byB0aGVtLAphbmQgYW55b25lIG1lZGRsaW5nIHdpdGggdGhpcyBjb2Rl
IHNob3VsZCBiZSBhYmxlIHRvIHVuZGVyc3RhbmQgaXQ/Cgo+PiArICogdGhpcyBjYXNlLCB0aGlz
IHZlbmRvciBjYW4gY3JlYXRlIGEgbmV3IG1hY3JvIEFMVEVSTkFUSVZFXzMoKSBiYXNlZAo+IAo+
IEFsc28sIHVzaW5nIHRoZSB3b3JkICJjYW4iLiBJcyBpdCBub3QgYSAibXVzdCIgcmF0aGVyIHRo
YW4gYSAiY2FuIiwKPiBzaW5jZSB0aGlzIHN0dWZmIG5lZWRzIHRvIGJlIG11bHRpcGxhdGZvcm0/
Cj4gCj4+ICsgKiBvbiB0aGUgZm9sbG93aW5nIHNhbXBsZSBjb2RlIGFuZCB0aGVuIHJlcGxhY2Ug
QUxURVJOQVRJVkVfMigpIHdpdGgKPj4gKyAqIEFMVEVSTkFUSVZFXzMoKSB0byBhcHBlbmQgaXRz
IGN1c3RvbWl6ZWQgY29udGVudC4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
