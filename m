Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29188C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 05:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJNbcI5GQ0r27nRawf/4qyN8o8MhsuAllu/BWysGVQk=; b=oV6gp7wFXtWOSv
	9JJVEBsbXu+tSNiWj3MVM+dc803bVX2V3cLqSgdhp7msx8nM2lzoua4lf8pJR5r5ZpgTBZgp0d00Y
	3G13AfgARphNcNSQN3+qdbeCV3qjgxbZyws5fGxe95ysKhPsIwbLo+PaDauEyQUEUFIC1ImRsOzEk
	8M2Hf8Z+tbdEO+2jLQdG+1ceuv1/Vgdp1ltAzixMaCpXGyoTaFKGVdsXutMtMq0/KBV9PM2QpSg6v
	beORNzQWPjX/o2pm12Gj2ctv+iOpBPh/E0/jd36PBdKPx67ngEcqgCWNILoOP1jrGqyxhjwTM9JW0
	09kJ/GQMho+0RjMO+41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen4q-00000000f9u-1XrR;
	Wed, 01 Jul 2026 05:01:36 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wen4n-00000000f9K-1gea
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 05:01:35 +0000
Received: from [10.213.6.98] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAHqtIbn0RqUP83BA--.18158S2;
	Wed, 01 Jul 2026 13:01:16 +0800 (CST)
Message-ID: <cd8cd425-7615-49a2-b26e-81a9aff0af28@iscas.ac.cn>
Date: Wed, 1 Jul 2026 13:01:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] riscv: mm: Avoid spurious fault after hotplugging
 vmemmap
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260630-mark-after-vmemmap-populate-v4-1-febbc15da028@iscas.ac.cn>
 <20260630211100.5c8f09c607595fbb5bca0a74@linux-foundation.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260630211100.5c8f09c607595fbb5bca0a74@linux-foundation.org>
X-CM-TRANSID: qwCowAAHqtIbn0RqUP83BA--.18158S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw15Kw1UArWrCr1kZrWfGrg_yoWkWrX_Cr
	sxKa4DW3yDJ3WDKw4rKF43Wr4kJayDA3yjvw1kKFWYvr9xAFnxXrZ2gryfuas7Gw4IqF1D
	J3srK3yfJw12vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26F4UJVW0ow
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUgl19UUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_220133_802575_3E6F8F60 
X-CRM114-Status: UNSURE (   5.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8xLzI2IDEyOjExLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IFsuLi5dCj4KPiBidHcsIEFJ
IHJldmlldyBzdWdnZXN0cyB0aGF0IHRoZXJlJ3MgYSBtaXNzaW5nIGJhcnJpZXIgaW4gdGhlcmUg
KGEKPiBwcmUtZXhpc3RpbmcgdGhpbmcpCj4KPiAJaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNjMwLW1hcmstYWZ0ZXItdm1lbW1hcC1wb3B1bGF0ZS12NC0xLWZlYmJjMTVkYTAy
OEBpc2Nhcy5hYy5jbgoKSW50ZXJlc3RpbmdseSwgd2hhdGV2ZXIgdGhpbmd5IHRoYXQgaXMgc2Vu
ZGluZyBwYXRjaGVzIGludG8gQUkgcmV2aWV3CnNlZW1zIHRvIGNvbXBsZXRlbHkgc3RyaXAgdGhl
IG1lc3NhZ2UgYmVsb3cgdGhlICItLS0iLCB3aGljaCBtYWRlIGl0IG1pc3M6CgogICAgQ2hhbmdl
cyBpbiB2NDoKICAgIC0gUmViYXNlIG9uIHY3LjItcmMxLCBkcm9wIGRlcGVuZGVuY2llcwogICAg
LSAoTm8gY29kZSBjaGFuZ2VzIG90aGVyd2lzZSkKICAgIC0gKEEgY29uY3VycmVuY3kgZml4IGZv
ciBtYXJrX25ld192YWxpZF9tYXAgd2FzIHNlbnQgaW5kZXBlbmRlbnRseSkKICAgIMKgIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYwNjI5LXJpc2N2LW1tLW5ldy12YWxp
ZC1tYXAtb3JkZXJpbmctdjEtMS02MGQ4YzEwYzYyOTJAaXNjYXMuYWMuY24vCiAgICAgIF4tLS0g
dGhpcwoKICAgIC0gTGluayB0byB2MzogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjA1
LW1hcmstYWZ0ZXItdm1lbW1hcC1wb3B1bGF0ZS12My0xLWEwNjAwMWFjOTI2NEBpc2Nhcy5hYy5j
bgoKKCJDaGFuZ2VzIiB3YXMgcHJvYmFibHkgbm90IHRoZSBiZXN0IHBsYWNlIHRvIHRoaXMga2lu
ZCBvZiBhZGRyZXNzaW5nCnJldmlldyBjb21tZW50cywgYnV0IHRoaXMgZGVmaW5pdGVseSBiZWxv
bmdlZCBiZWxvdyB0aGUgY3V0LikKCkkndmUgcmVwb3J0ZWQgImJlaW5nIGFibGUgdG8gcmVhZCBi
ZWxvdyB0aGUgY3V0IiBhcyBhIGZlYXR1cmUgcmVxdWVzdCB0bwpTYXNoaWtvOiBodHRwczovL2dp
dGh1Yi5jb20vc2FzaGlrby1kZXYvc2FzaGlrby9pc3N1ZXMvMzA2CgpWaXZpYW4gImRyYW1mb3Jl
dmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
