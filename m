Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4434BC64EC4
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jz+06r86J8iMP8EOu9bKYElYaQSg0xe9mMd4gzml7i0=; b=nOCQG4hzNXlEeJ
	N6WJix1rRAB8pywNuqvlGTp782kxxrSzO2bIxZTErOBehMn6l/8bcHLf5scl+8jHPnmAWERBz/m+H
	ghytT4PH+SYbMWE+DnstrFPZ19N39n0UrjOgy1ySEqjycohViBfrJM//dhJ57RR20niwXPtEtejxW
	hXyj2knttNaHp10t+RamONwiKyp3Vhu5VVM7Jq4xTcgrwX30jNdr4eh9vNiVkvU2fZIivw4fUhdq0
	694I9sXKId3AMUVmdYEGcLrVCZi0/KkNL7bcmusI7Rv6VuNNPQAvBDCw90hdYAi7l58oCu1M/5vHq
	6h7OwqsPcKj1GGBq9Kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPEF-008mg4-CU; Sat, 04 Mar 2023 10:35:03 +0000
Received: from smtpout1.mo528.mail-out.ovh.net ([46.105.34.251])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYPE3-008mdv-BV; Sat, 04 Mar 2023 10:34:53 +0000
Received: from pro2.mail.ovh.net (unknown [10.108.20.84])
	by mo528.mail-out.ovh.net (Postfix) with ESMTPS id BF00C20CD4;
	Sat,  4 Mar 2023 10:34:40 +0000 (UTC)
Received: from [192.168.1.41] (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 4 Mar
 2023 11:34:39 +0100
Message-ID: <7fa7f07f-d1e1-1e43-992c-4981c5810284@traphandler.com>
Date: Sat, 4 Mar 2023 11:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] of: irq: make callers of of_irq_parse_one() release
 the device node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <saravanak@google.com>, <clement.leger@bootlin.com>, Magnus Damm
	<magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, <zajec5@gmail.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Marc Zyngier <maz@kernel.org>,
	<afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
	<frowand.list@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Nishanth Menon
	<nm@ti.com>, <ssantosh@kernel.org>, <mathias.nyman@intel.com>,
	<gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-wireless@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <devicetree@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
References: <20230301185209.274134-1-jjhiblot@traphandler.com>
 <20230301185209.274134-3-jjhiblot@traphandler.com>
 <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
From: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
In-Reply-To: <CAMuHMdVF337k+zyjpbzoDtWWDnYhM6eM3+As6UuZ7FCgASsMQg@mail.gmail.com>
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: CAS2.emp2.local (172.16.1.2) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 2216615445481994549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepvdefkedugeekueeuvdeuueevjefftddvtefhleekhfefffdtteetffeigfdvtdeinecukfhppeduvdejrddtrddtrddupdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhjhhhisghlohhtsehtrhgrphhhrghnughlvghrrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdpsghhvghlghgrrghssehgohhoghhlvgdrtghomhdpnhhmsehtihdrtghomhdpshhsrghnthhoshhhsehkvghrnhgvlhdrohhrghdpmhgrthhhihgrshdrnhihmhgrnhesihhnthgvlhdrtghomhdpghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdpjhhonhgrthhhrg
 hnhhesnhhvihguihgrrdgtohhmpdhlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhkvghrnhgvlhdrohhrghdplhhinhhugidqrggtthhiohhnsheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdpuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhfrhhofigrnhgurdhlihhsthesghhmrghilhdrtghomhdplhhinhhugidquhhssgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhhosghhodgutheskhgvrhhnvghlrdhorhhgpdhjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdpshgrrhgrvhgrnhgrkhesghhoohhglhgvrdgtohhmpdgtlhgvmhgvnhhtrdhlvghgvghrsegsohhothhlihhnrdgtohhmpdhmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhlihhnuhigsegrrhhmlhhinhhugid
 rohhrghdruhhkpdhmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpnhhpihhgghhinhesghhmrghilhdrtghomhdptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdpiigrjhgvtgehsehgmhgrihhlrdgtohhmpdgurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhtghhlgieslhhinhhuthhrohhnihigrdguvgdptghlrghuughiuhdrsggviihnvggrsehmihgtrhhotghhihhprdgtohhmpdhmrgiisehkvghrnhgvlhdrohhrghdprghfrggvrhgsvghrsehsuhhsvgdruggvpdhmrghniheskhgvrhhnvghlrdhorhhgpdhprghlmhgvrhesuggrsggsvghlthdrtghomhdpphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdifvghnshestghsihgvrdhorhhgpdhsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehvdekpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_023451_715122_CF12634E 
X-CRM114-Status: GOOD (  23.84  )
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

CgpPbiAwMi8wMy8yMDIzIDA4OjQ5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgSmVh
bi1KYWNxdWVzLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiBPbiBXZWQsIE1hciAx
LCAyMDIzIGF0IDc6NTPigK9QTSBKZWFuLUphY3F1ZXMgSGlibG90Cj4gPGpqaGlibG90QHRyYXBo
YW5kbGVyLmNvbT4gd3JvdGU6Cj4+IG9mX2lycV9wYXJzZV9vbmUoKSBkb2VzIGEgZ2V0KCkgb24g
dGhlIGRldmljZSBub2RlIHJldHVybmVkIGluIG91dF9pcnEtPm5wLgo+PiBDYWxsZXJzIG9mIG9m
X2lycV9wYXJzZV9vbmUoKSBtdXN0IGRvIGEgcHV0KCkgd2hlbiB0aGV5IGFyZSBkb25lIHdpdGgg
aXQuCj4gCj4gV2hhdCBkb2VzICJiZSBkb25lIHdpdGggaXQiIHJlYWxseSBtZWFuIGhlcmU/Cj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRyYXBoYW5k
bGVyLmNvbT4KPiAKPj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1zaG1vYmlsZS9yZWd1bGF0b3ItcXVp
cmstcmNhci1nZW4yLmMKPj4gKysrIGIvYXJjaC9hcm0vbWFjaC1zaG1vYmlsZS9yZWd1bGF0b3It
cXVpcmstcmNhci1nZW4yLmMKPj4gQEAgLTE4NCw2ICsxODQsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCByY2FyX2dlbjJfcmVndWxhdG9yX3F1aXJrKHZvaWQpCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBrZnJlZShxdWlyayk7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
Pj4gICAgICAgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChhcmdz
YS0+bnApOwo+IAo+IFRoZSBxdWlyayBvYmplY3QsIHdoaWNoIGlzIGEgY29udGFpbmVyIG9mIGFy
Z3NhLCBpcyBzdGlsbCB1c2VkIGJlbG93LAo+IGFuZCBzdG9yZWQgaW4gYSBsaW5rZWQgbGlzdC4g
IEkgYWdyZWUgYXJnc2EtPm5wIGlzIG5vdCBkZXJlZmVyZW5jZWQsCj4gYnV0IHRoZSBwb2ludGVy
IGl0c2VsZiBpcyBzdGlsbCBjb21wYXJlZCB0byBvdGhlciBwb2ludGVycy4KSGkgR2VlcnQsCgpJ
IGZhaWwgdG8gc2VlIHdoZW4gdGhlIHBvaW50ZXJzIGFyZSBjb21wYXJlZC4gSXQgbG9va3MgdG8g
bWUgdGhhdCBvbmx5IAp0aGUgYXJncyBhcmUgY29tcGFyZWQuIEFtIEkgbWlzc2luZyBzb21ldGhp
bmcgPwpJbiBhbnkgY2FzZSwgbG9va2luZyBtb3JlIGNsb3NlbHkgYXQgdGhlIGNvZGUsIEkgZ3Vl
c3MgdGhhdCBpbmRlZWQgdGhlCm9mX25vZGVfcHV0KCkgc2hvdWxkbid0IGJlIGFkZGVkIGhlcmUg
YmVjYXVzZSB0aGlzIGNvZGUgZXhwZWN0cyB0aGF0IHRoZQpub2RlcyBuZXZlciBnbyBhd2F5LiBU
aGF0IGlzIHByb2JhYmx5IGEgZ29vZCBhc3NlcnRpb24gaW4gY2FzZSBvZiBQTUlDcwoKSkoKPiBJ
SVVJQywgY2FsbGluZyBvZl9ub2RlX3B1dCgpIG1pZ2h0IGNhdXNlIHRoZSByZWZlcmVuY2UgY291
bnQgdG8gZHJvcCB0bwo+IHplcm8sIGFuZCB0aGUgdW5kZXJseWluZyBzdHJ1Y3Qgbm9kZSBvYmpl
Y3QgdG8gYmUgZGVhbGxvY2F0ZWQuCj4gU28gd2hlbiBhIGZ1dHVyZSByZWZlcmVuY2UgdG8gdGhl
IHNhbWUgRFQgbm9kZSB3aWxsIGJlIHRha2VuLCBhIG5ldwo+IHN0cnVjdCBub2RlIG9iamVjdCB3
aWxsIGJlIGFsbG9jYXRlZCwgYW5kIHRoZSBwb2ludGVyIGNvbXBhcmlzb24gYmVsb3cKPiB3aWxs
IGZhaWw/Cj4gCj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBHcntvZXRqZSxlZXRp
bmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
