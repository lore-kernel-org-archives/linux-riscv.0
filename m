Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AD3CD4F2C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 07:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zL5keKG02kCLxg8mLtTUByM84l8VisHEDOnOLsGn+lc=; b=WGmVrP0vSNx2Z3
	WlSOkudAkoLaAe3XY8XLvtKNQqnET6of5XGcp7lh2j42agimpPI+I7VlqRtnphvLlEOe3Vf7CpDzL
	aqq9b46zk/VtYjirvx61NfrG3WmvCVRvQWUoWcA6I1KwgC9N12EfeVwCdHjlJQBdbPdNuRCuo5hki
	sCgiPlLWlwTUKJr/fFRK7kH8ra6c8ppx/2q1XyaTJlz0UVQA420mPnNu9rwPdXxo81NeSlYz2+xtp
	Bw0TyRPaqF65wWc5wB+r3re5OITceThxM4HaUU1LE43vu7qkUj6JGd2PvhuQdIa7QQeQS/A5GzZjt
	xpaUpf3UrUA0W6c7if3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwJl-0000000ATNM-1vlg;
	Fri, 12 Jun 2026 07:28:41 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwJi-0000000ATMD-03H6
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 07:28:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-8423f52af13so549796b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jun 2026 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781249317; x=1781854117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66pdCW0yOW5Nk6MUhQzAUTYI58FQ4Ifcfuf+SyuK5QE=;
        b=knH7F9p6e24S5Bxa6iqKH/CvgHklIVx6BRnNu73Kz3Q3OxpIGc6AQ1O7g78dWAbHuy
         oQNYIYZTpY6SAQfOG/R5Ci44WGh1V8Il2NpZW+Zn0bcoWNyyXWIHEutibyl0AIf4VPVw
         P5w4yf3HHTBHE79HmubGI0yy053QDJJxm8ThjzBLitBVOj1S/r9zjdL9SMmhWLTPRVhs
         wn1F41jcrviR15ZJCke8aD7YE2K5yoe8jNyUvBDYYvZ7xli71R1sXGF2qBxgkBC3q/bM
         CuyuSM6FKy9KLab7S7KM0fLsrT6utCqGYANTc3OAm6oF5fmuwEp9cetNRqb+V1AtzIjC
         i7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249317; x=1781854117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66pdCW0yOW5Nk6MUhQzAUTYI58FQ4Ifcfuf+SyuK5QE=;
        b=dC70dbLkk5BxLFQXoR8x6NIVIn+sYLqGbkXOV9MU8RE6ZoPSEsphm8PRrbDKzoGwZb
         JtexodwAC4lgK39FL66tbYCJnHbGAkebghyqrMCO8Z96BRQPy8sfiUTKK0sVXNu0Fkyk
         BW6jJAZx86pqitogUmMtDLLTi857pAXUdXt3SKexqR/jj0fikxQQrLTQ92bvfqOr0Ih+
         F8V5u3KgCPFGL4wqLuesjA1ojLvuFfw/GpnsXi/YVJFpMXFA3O9VjKxht+U3tfPON/dx
         aQsZ8aQDc5BT44vDX/6QiTxc0GPFmMKyOeYtHFSXN3ugmgIjtURp+teMkquqP0LgOIr9
         n/5g==
X-Forwarded-Encrypted: i=1; AFNElJ9wH5gDeN60twfr2bzB9L3uGWMQx51JaZ/nXyEJbAuODLqjbHWcvn5rSWhr7fuItdprcZbp7dC+UmoThQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqwfUMLG7WeZzPZfaCz9Tl9ykHZQMIKxvQUqIYUxb2MEYred2Z
	qAnEh5zRtQE19fVWiM6fHMGozojkIo3WxhrknadbYyLSgoQsTnipKpF1
X-Gm-Gg: Acq92OF9eJ4VXY5BHXfV2qEet4korMwaBHsLi8ypYAjmyXAIooWWCwRpTc5rQCQbOJ2
	7jPL5zptPrw4HfZnt7xUIMrHHk05OEb4MCl5skIxy0LOOwJzIH5GG5GBTQXnxtqzyyMxKVgt1gQ
	/fjeZFTAJXy3ba6NPgqGjT4Gqi483VmcAk6lgdCqYuZKfiAAi58ELsUi/4UwapAcB1qiMZP8Ns6
	iL49x4lyH6UtHxuAKufGe24wP2kqMd27EYAIrmBOWblCmNqPaeax4UCBXp2ISJYrhU/bLBdone3
	ZQXT4jipDV9OSzteektGF08y3g+9CdiSEfhsq0Oo6NYToFQVHRDVUWYXhmNke3IRqyErP4JqT7O
	hfgsB5gZgf9Kmhn84Y7Yo3D2OTakTZSjiMiUmVI0BKgRxi3UZEDPF58ofCdz9w6XfPFM8i/lfyn
	jQNXVQEjiugTHuhphx6TRzbGNnxK2wQof7YwOupkqVvA==
X-Received: by 2002:a05:6a00:218c:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-8434cc08379mr1646577b3a.10.1781249316540;
        Fri, 12 Jun 2026 00:28:36 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a9bsm1278464b3a.31.2026.06.12.00.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:28:35 -0700 (PDT)
Message-ID: <27a06e00-ac47-4e5f-8033-4e89f15d0411@gmail.com>
Date: Fri, 12 Jun 2026 15:28:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org,
 iommu@lists.linux.dev, zhaomeijing@lixiang.com, Rob Herring
 <robh@kernel.org>, saravanak@kernel.org, bhe@redhat.com, rppt@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 chenhuacai@kernel.org, kernel@xen0n.name, catalin.marinas@arm.com,
 will@kernel.org, alex@ghiti.fr, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 m.szyprowski@samsung.com, robin.murphy@arm.com
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <7ed207fa-4c86-426a-8570-495902ce04c3@gmail.com>
 <a3993db0-6975-455d-9674-4fd7cfcf80fc@gmail.com>
 <aiqkKe1gXPZ5LZ7t@MiWiFi-R3L-srv>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aiqkKe1gXPZ5LZ7t@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_002838_055761_2A980447 
X-CRM114-Status: GOOD (  21.66  )
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

CgpPbiA2LzExLzI2IDIwOjAzLCBCYW9xdWFuIEhlIHdyb3RlOgo+IE9uIDA2LzExLzI2IGF0IDEx
OjA5YW0sIFdhbmR1biB3cm90ZToKPj4KPj4KPj4gT24gNi8xMS8yNiAxMDowOSwgV2FuZHVuIHdy
b3RlOgo+Pj4KPj4+Cj4+PiBPbiA1LzI3LzI2IDExOjI5LCBXYW5kdW4gQ2hlbiB3cm90ZToKPj4+
PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPj4+Pgo+Pj4+IE9u
IFNvQ3MgdGhhdCBjYXJ2ZSBvdXQgbGFyZ2UgZmlybXdhcmUtb3duZWQgcmVzZXJ2ZWQgbWVtb3J5
IChHUFUKPj4+PiBmaXJtd2FyZSwgRFNQLCBtb2RlbSwgY2FtZXJhIElTUCwgTlBVLCAuLi4pLCBr
ZHVtcCBjdXJyZW50bHkgZHVtcHMKPj4+PiB0aG9zZSBjYXJ2ZW91dHMgYXMgcGFydCBvZiBzeXN0
ZW0gUkFNIGV2ZW4gdGhvdWdoIHRoZWlyIGNvbnRlbnRzIGFyZQo+Pj4+IGZpcm13YXJlIHN0YXRl
IHRoYXQgaXMgbm90IHVzZWZ1bCBmb3Iga2VybmVsIGNyYXNoIGFuYWx5c2lzLgo+Pj4+Cj4+Pj4g
VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhbiBvcHQtaW4gJ2R1bXBhYmxlJyBmbGFnIFsxXSBvbiBz
dHJ1Y3QKPj4+PiByZXNlcnZlZF9tZW0gYW5kIHVzZXMgaXQgdG8gZmlsdGVyIHRoZSBlbGZjb3Jl
aGRyIFBUX0xPQUQgcmFuZ2VzIG9uCj4+Pj4gRFQtYmFzZWQgYXJjaGl0ZWN0dXJlcyAoYXJtNjQs
IHJpc2N2LCBsb29uZ2FyY2gpLiBCeSBkZWZhdWx0IHJlc2VydmVkCj4+Pj4gcmVnaW9ucyBhcmUg
dHJlYXRlZCBhcyBub24tZHVtcGFibGU7IENNQSByZWdpb25zIGFyZSBleHBsaWNpdGx5IG9wdGVk
Cj4+Pj4gaW4gYmVjYXVzZSB0aGVpciBwYWdlcyBhcmUgcmV0dXJuZWQgdG8gdGhlIGJ1ZGR5IGFs
bG9jYXRvciBhbmQgbWF5Cj4+Pj4gY2Fycnkga2V5IGNyYXNoLWFuYWx5c2lzIGRhdGEuCj4+Pj4K
Pj4+PiBUaGUgc2VyaWVzIGlzIG9yZ2FuaXplZCBhcyBmb2xsb3dzOgo+Pj4+IFBhdGNoZXMgMS0z
OiBQcmUtZXhpc3RpbmcgZml4ZXMgYW5kIGEgc21hbGwgcHJlcCBjaGFuZ2UuCj4+Pj4gUGF0Y2hl
cyA0LTU6IFJlc3RydWN0dXJlIHRvIGFsbG93IGFwcGVuZGluZyAvbWVtcmVzZXJ2ZS8gZW50cmll
cy4KPj4+PiBQYXRjaGVzIDYtNzogQWRkIGEgZHVtcGFibGUgZmxhZyBhbmQgYXBwZW5kIC9tZW1y
ZXNlcnZlLyBlbnRyaWVzLgo+Pj4+IFBhdGNoIDg6IEFkZCBnZW5lcmljIGtkdW1wIGhlbHBlcnMu
Cj4+Pj4gUGF0Y2hlcyA5LTExOiBXaXJlIHRoZSBoZWxwZXJzIGludG8gYXJtNjQsIHJpc2N2IGFu
ZCBsb29uZ2FyY2gga2R1bXAKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsZmNv
cmVoZHIgcHJlcGFyYXRpb24uCj4+PiBIaSwKPj4+Cj4+PiBHZW50bGUgcGluZyBvbiB0aGlzIHNl
cmllcy4KPj4+Cj4+PiBTdGF0dXMgc3VtbWFyeToKPj4+IC1wYXRjaCAwMzogcmVzcHVuIHNlcGFy
YXRlbHkgcGVyIFJvYidzIHN1Z2dlc3Rpb24sIHBpY2tlZCB1cCBmb3IgNy4yCj4+PiAtcGF0Y2gg
MDY6IEFja2VkLWJ5OiBNYXJlayBTenlwcm93c2tpIC1wYXRjaCAwOTogQWNrZWQtYnk6IFdpbGwg
RGVhY29uCj4+PiBUaGUgcmVtYWluaW5nIHBhdGNoZXMgKDAxLCAwMiwgMDQsIDA1LCAwNywgMDgs
IDEwLCAxMSkgYXJlIHN0aWxsCj4+PiBhd2FpdGluZyByZXZpZXcuIHlvdXIgZmVlZGJhY2sgd291
bGQgYmUgZ3JlYXRlbHkgYXBwcmVjaWF0ZWQuIEkga25vdyB3ZQo+Pj4gYXJlIGF0IHRoZSBlbmQg
b2YgNy4xIC1yYyBjeWNsZSwgSSBkb24ndCB3YW50IHRvIHJ1c2ggdGhpcyBzZXJpZXMsIGp1c3QK
Pj4+IGNvbGxlY3RpbmcgbW9yZSBmZWVkYmFjaywgYW5kIHdpbGwgc2VuZCBuZXh0IHZlcnNpb24g
YmFzZWQgb24gNy4yLXJjMS4KPj4+IElmIHNwbGl0aW5nIHRoZSBzZXJpZXMgaW50byBzbWFsbGVy
IGxvZ2ljYWwgZ3JvdXAgd291bGQgbWFrZSByZXZpZXcKPj4+IGVhc2llciwgcGxlYXNlIGxldCBt
ZSBrbm93LiBCZXN0IHJlZ2FyZHMsIFdhbmR1bgo+Pgo+PiBBcG9sb2dpZXMgZm9yIHRoZSBmb3Jt
YXR0aW5nIGlzc3VlIGluIG15IHByZXZpb3VzIGVtYWlsLgo+PiBIZXJlIGlzIHRoZSBwcm9wZXJs
eSBmb3JtYXR0ZWQgdmVyc2lvbi4KPj4KPj4gR2VudGxlIHBpbmcgb24gdGhpcyBzZXJpZXMuCj4g
Cj4gVGhhbmtzIGZvciB0aGUgZWZmb3J0LCB0aGUgb3ZlcnJhbCBsb29rcyBnb29kIHRvIG1lIGF0
IDFzdCBnbGFuY2UuIEkgd2lsbAo+IGNoZWNrIGlmIHRoZXJlJ3MgY29uY2VybiBvbiBnZW5lcmlj
IHBhcnQuIEFuZCBtZWFud2hpbGUsIEkgYW0gd29uZGVyaW5nCj4gaWYgdGhlcmUncyBhbnkgY2hh
bmNlIHg4NiBvciBvdGhlciBBUkNILWVzIHcvbyBPRi9GRFQgY2FuIGFsc28gY2hvb3NlIHRvCj4g
bm90IGR1bXAgc29tZSBhcmVhcywgZS5nIEdQVSBzdG9sZW4gbWVtb3J5LiBTdXJlbHksIHRoYXQn
cyBhbm90aGVyIHN0b3J5LgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBCYW9xdWFuLgoKSUlVQywg
cmVzZXJ2ZWQgbWVtb3J5IGlzIGFscmVhZHkgZXhjbHVkZWQgZnJvbSB2bWNvcmUgb24geDg2LgoK
UmVzZXJ2ZWQgbWVtb3J5IGlzIHR5cGVkIGFzIEU4MjBfVFlQRV9SRVNFUlZFRCBpbiB0aGUgZTgy
MCB0YWJsZSwgYW5kCmluc2VydCBpbnRvIGlvbWVtIHJlc291cmNlIHRyZWUgd2l0aCBJT1JFU09V
UkNFX01FTSBmbGFnLiBUaGUgeDg2IGtkdW1wCnBhdGNoIHVzZXMgd2Fsa19zeXN0ZW1fcmFtX3Jl
cygpIHdoaWNoIHNjYW4gaW9tZW0gcmVzb3VyY2UgdHJlZSwgYW5kCm9ubHkgY29sbGVjdHMgcmFu
Z2VzIHdpdGggSU9SRVNPVVJDRV9TWVNURU1fUkFNIGZsYWcsIHNvIHJlc2VydmVkCnJlZ2lvbnMg
YXJlIGV4Y2x1ZGVkLgoKCkJlc3QgcmVnYXJkcywKV2FuZHVuCj4gCj4+Cj4+IFN0YXR1cyBzdW1t
YXJ5Ogo+PiAtIHBhdGNoIDAzOiByZXNwdW4gc2VwYXJhdGVseSBwZXIgUm9iJ3Mgc3VnZ2VzdGlv
biwgcGlja2VkIHVwIGZvciA3LjIKPj4gLSBwYXRjaCAwNjogQWNrZWQtYnk6IE1hcmVrIFN6eXBy
b3dza2kKPj4gLSBwYXRjaCAwOTogQWNrZWQtYnk6IFdpbGwgRGVhY29uCj4+Cj4+IFRoZSByZW1h
aW5pbmcgcGF0Y2hlcyAoMDEsIDAyLCAwNCwgMDUsIDA3LCAwOCwgMTAsIDExKSBhcmUgc3RpbGwK
Pj4gYXdhaXRpbmcgcmV2aWV3LiBZb3VyIGZlZWRiYWNrIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVj
aWF0ZWQuCj4+Cj4+IEkga25vdyB3ZSBhcmUgYXQgdGhlIGVuZCBvZiA3LjEtcmMgY3ljbGUsIEkg
ZG9uJ3Qgd2FudCB0byBydXNoIHRoaXMKPj4gc2VyaWVzLCBqdXN0IGNvbGxlY3RpbmcgbW9yZSBm
ZWVkYmFjaywgYW5kIHdpbGwgc2VuZCBuZXh0IHZlcnNpb24gYmFzZWQKPj4gb24gNy4yLXJjMS4K
Pj4KPj4gSWYgc3BsaXR0aW5nIHRoZSBzZXJpZXMgaW50byBzbWFsbGVyIGxvZ2ljYWwgZ3JvdXBz
IHdvdWxkIG1ha2UgcmV2aWV3Cj4+IGVhc2llciwgcGxlYXNlIGxldCBtZSBrbm93Lgo+Pgo+PiBC
ZXN0IHJlZ2FyZHMsCj4+IFdhbmR1bgo+Pgo+Pgo+Pj4+Cj4+Pj4gdjIgLS0+IHYzOgo+Pj4+IDEu
IEZpeCBvdXQtb2YtYm91bmRzIGlzc3VlIGlmIGRldmljZSB0cmVlIGxhY2tzIC9yZXNlcnZlZC1t
ZW1vcnkgbm9kZS5bMl0KPj4+PiAyLiBGaXggVUFGIGlzc3VlIHdoZW4gYWxsb2NfcmVzZXJ2ZWRf
bWVtX2FycmF5KCkgZmFpbHMuCj4+Pj4gMy4gQWRkIHNvbWUgcHJlcGFyZSBwYXRjaGVzLgo+Pj4+
Cj4+Pj4gdjEgLS0+IHYyOgo+Pj4+IDEuIHYxIGFkZGVkIGFuIG9wdC1vdXQgRFQgcHJvcGVydHkg
KCdsaW51eCxuby1kdW1wJykuIFBlciBSb2Incwo+Pj4+IMKgwqDCoCBmZWVkYmFjayBbMV0sIHYy
IGRyb3AgdGhhdCBwcm9wZXJ0eSBhbmQgZXhjbHVkZSByZXNlcnZlIG1lbW9yeQo+Pj4+IMKgwqDC
oCBieSBkZWZhdWx0Lgo+Pj4+IDIuIFNwbGl0IHNvbWUgcHJlcGFyZWQgcGF0Y2hlcyBmcm9tIHRo
ZSBvcmlnaW5hbCBwYXRjaGVzLgo+Pj4+IDMuIEFkZHJlc3MgY29kaW5nLXN0eWxlIGNvbW1lbnRz
IG9uIHBhdGNoIDUgZnJvbSBSb2IuCj4+Pj4KPj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDI2MDUwNjE0NDU0Mi5HQTIwNzI1OTYtCj4+Pj4gcm9iaEBrZXJuZWwub3JnLwo+
Pj4+IFsyXSBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjAwOTE4NDQuNTky
NzUzLTEtCj4+Pj4gY2hlbndhbmR1biU0MGxpeGlhbmcuY29tP3BhcnQ9NAo+Pj4+Cj4+Pj4gV2Fu
ZHVuIENoZW4gKDExKToKPj4+PiDCoMKgIG9mOiByZXNlcnZlZF9tZW06IGhhbmRsZSBOVUxMIG5h
bWUgaW4gb2ZfcmVzZXJ2ZWRfbWVtX2xvb2t1cCgpCj4+Pj4gwqDCoCBrZXhlYy9jcmFzaDogcHJv
dmlkZSBjcmFzaF9leGNsdWRlX21lbV9yYW5nZSgpIHN0dWIgd2hlbgo+Pj4+IMKgwqDCoMKgIENP
TkZJR19DUkFTSF9EVU1QPW4KPj4+PiDCoMKgIG9mOiByZXNlcnZlZF9tZW06IGF2b2lkIHBvc3Qt
aW5pdCBVQUYgd2hlbiBhbGxvY19yZXNlcnZlZF9tZW1fYXJyYXkoKQo+Pj4+IMKgwqDCoMKgIGZh
aWxzCj4+Pj4gwqDCoCBvZjogcmVzZXJ2ZWRfbWVtOiB6ZXJvIHRvdGFsX3Jlc2VydmVkX21lbV9j
bnQgaWYgbm8gdmFsaWQKPj4+PiDCoMKgwqDCoCAvcmVzZXJ2ZWQtbWVtb3J5IGVudHJ5Cj4+Pj4g
wqDCoCBvZjogcmVzZXJ2ZWRfbWVtOiBzcGxpdCBhbGxvY19yZXNlcnZlZF9tZW1fYXJyYXkoKSBm
cm9tCj4+Pj4gwqDCoMKgwqAgZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtX2xhdGUoKQo+Pj4+IMKgwqAg
b2Y6IHJlc2VydmVkX21lbTogYWRkIGR1bXBhYmxlIGZsYWcgdG8gb3B0LWluIHZtY29yZQo+Pj4+
IMKgwqAgb2Y6IHJlc2VydmVkX21lbTogc2F2ZSAvbWVtcmVzZXJ2ZS8gZW50cmllcyBpbnRvIHRo
ZSByZXNlcnZlZF9tZW0KPj4+PiDCoMKgwqDCoCBhcnJheQo+Pj4+IMKgwqAgb2Y6IHJlc2VydmVk
X21lbTogYWRkIGtkdW1wIGhlbHBlcnMgdG8gZXhjbHVkZSBub24tZHVtcGFibGUgcmVnaW9ucwo+
Pj4+IMKgwqAgYXJtNjQ6IGtkdW1wOiBleGNsdWRlIG5vbi1kdW1wYWJsZSByZXNlcnZlZCBtZW1v
cnkgcmVnaW9ucyBmcm9tIHZtY29yZQo+Pj4+IMKgwqAgcmlzY3Y6IGtkdW1wOiBleGNsdWRlIG5v
bi1kdW1wYWJsZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBmcm9tIHZtY29yZQo+Pj4+IMKgwqAg
bG9vbmdhcmNoOiBrZHVtcDogZXhjbHVkZSBub24tZHVtcGFibGUgcmVzZXJ2ZWQgbWVtb3J5IHJl
Z2lvbnMgZnJvbQo+Pj4+IMKgwqDCoMKgIHZtY29yZQo+Pj4+Cj4+Pj4gwqAgYXJjaC9hcm02NC9r
ZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmPCoMKgwqDCoCB8wqDCoCA2ICsrCj4+Pj4gwqAgYXJj
aC9sb29uZ2FyY2gva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHzCoMKgIDYgKysKPj4+PiDC
oCBhcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuY8KgwqDCoMKgIHzCoMKgIDQg
Kwo+Pj4+IMKgIGRyaXZlcnMvb2YvZmR0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMSArLQo+Pj4+IMKgIGRyaXZlcnMvb2Yvb2ZfcHJp
dmF0ZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArCj4+
Pj4gwqAgZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxMTcgKysrKysrKysrKysrKysrKysrKy0tCj4+Pj4gwqAgaW5jbHVkZS9saW51eC9j
cmFzaF9jb3JlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICsrCj4+
Pj4gwqAgaW5jbHVkZS9saW51eC9vZl9yZXNlcnZlZF9tZW0uaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDE1ICsrKwo+Pj4+IMKgIGtlcm5lbC9kbWEvY29udGlndW91cy5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqAgOSBmaWxlcyBjaGFu
Z2VkLCAxNTcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+Cj4+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
