Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D254C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmWQUHIG2vwPtaEEXB0isoAyRZLoMIKKNtGeUyaRTVs=; b=S6N6alu4vUdqJb
	0jfX6yNThPoOmEUmZgCJvDScdE7ViTRpBNPWJWWJ/JD+KdqRHDTFthy0vhJb1n+5iVCU3YlPSlwl7
	b5J20eCkUm85ycyaKm7frmAXXABYCvNvmjHZGziLgZCY6kknzobBkWYNTtVEMC6JmgRqdyRaa7sV/
	giaSYqklHxXEyrRpC2m8NxLqvimRw7dlFAtvduQA/JQmjLCAXIa3iJnLaO/ZixIS77W4/DbnY+/oc
	AbY1woxCMZXmf4GfybC/bMD9IK/ZzhBNPWMxY6Y8zL60kbU8SJc8lzuieZWGMIP78ERC/vd6Inqb+
	oxSvNE7uXRoXzuV9gX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrgtd-000sAr-5J; Mon, 29 Nov 2021 13:40:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrgtb-000sAK-84
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 13:40:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABFA9614DF;
 Mon, 29 Nov 2021 13:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD6AC004E1;
 Mon, 29 Nov 2021 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638193238;
 bh=1mPhNQdmaAP5oOzTHlTQd9ACQe9dnZDwnV1997OZe8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q003J9f7UTAZEw+i85oNjhmzhJs+gbK0svlKqeOGk/fQJ9Dkzn/dRhTo7Ggc9EV6B
 oLvfCOVqyxEaaP0Dzh4tiTtU8ag0AXpuV5C/E53AoyxAitfiyi2tUeZSuzqr0tA7D8
 hLgVIDR1IE1bTOqUoq+2CpjdqQFm91ANAl37jlGQOIEKWR/p6gsVVVRIJbOhohqXb9
 8R5EFw1qcVyk6XhbvvG7pOODgvhKiUr+7IfbCGMJ5S6JChRCAiYbGJT/rmrpH+HL6D
 aSws62t4VMx1rTeIdbW/LUmYJLr+1IuQl+dn5WxTg/DsOxYqjAuomYqARDYHCCa8nU
 3vhAjcoXcEpGg==
Date: Mon, 29 Nov 2021 21:33:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: wefu@redhat.com
Cc: anup.patel@wdc.com, atishp04@gmail.com, palmer@dabbelt.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com, guoren@linux.alibaba.com, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com
Subject: Re: [PATCH V4 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
Message-ID: <20211129213309.40673113@xhacker>
In-Reply-To: <20211129014007.286478-1-wefu@redhat.com>
References: <20211129014007.286478-1-wefu@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_054039_395307_829D48E0 
X-CRM114-Status: GOOD (  16.58  )
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

T24gTW9uLCAyOSBOb3YgMjAyMSAwOTo0MDowNSArMDgwMAp3ZWZ1QHJlZGhhdC5jb20gd3JvdGU6
Cgo+IEZyb206IEZ1IFdlaSA8d2VmdUByZWRoYXQuY29tPgo+IAo+IFRoaXMgcGF0Y2ggZm9sbG93
cyB0aGUgIFJJU0MtViBzdGFuZGFyZCBTdnBibXQgZXh0ZW5zaW9uIGluIAo+IHByaXZpbGVnZSBz
cGVjIHRvIHNvbHZlIHRoZSBub24tY29oZXJlbnQgU09DIERNQSBzeW5jaHJvbml6YXRpb24KPiBp
c3N1ZXMuCj4gCj4gVGhlIHN2cGJtdCBQVEUgZm9ybWF0Ogo+IHwgNjMgfCA2Mi02MSB8IDYwLTgg
fCA3IHwgNiB8IDUgfCA0IHwgMyB8IDIgfCAxIHwgMAo+ICAgTiAgICAgTVQgICAgIFJTVyAgICBE
ICAgQSAgIEcgICBVICAgWCAgIFcgICBSICAgVgo+ICAgICAgICAgXgo+IAo+IE9mIHRoZSBSZXNl
cnZlZCBiaXRzIFs2Mzo1NF0gaW4gYSBsZWFmIFBURSwgdGhlIGJpdHMgWzYyOjYxXSBhcmUgdXNl
ZCBhcwo+IHRoZSBNVCAoYWthIE1lbVR5cGUpIGZpZWxkLiBUaGlzIGZpZWxkIHNwZWNpZmllcyBv
bmUgb2YgdGhyZWUgbWVtb3J5IHR5cGVzCj4gYXMgc2hvd24gaW4gdGhlIGZvbGxvd2luZyB0YWJs
Ze+8mgo+IE1lbVR5cGUgICAgIFJJU0MtViBEZXNjcmlwdGlvbgo+IC0tLS0tLS0tLS0gIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IDAwIC0gUE1BICAg
IE5vcm1hbCBDYWNoZWFibGUsIE5vIGNoYW5nZSB0byBpbXBsaWVkIFBNQSBtZW1vcnkgdHlwZQo+
IDAxIC0gTkMgICAgIE5vbi1jYWNoZWFibGUsIGlkZW1wb3RlbnQsIHdlYWtseS1vcmRlcmVkIE1h
aW4gTWVtb3J5Cj4gMTAgLSBJTyAgICAgTm9uLWNhY2hlYWJsZSwgbm9uLWlkZW1wb3RlbnQsIHN0
cm9uZ2x5LW9yZGVyZWQgSS9PIG1lbW9yeQo+IDExIC0gUnN2ZCAgIFJlc2VydmVkIGZvciBmdXR1
cmUgc3RhbmRhcmQgdXNlCj4gCj4gVGhlIHN0YW5kYXJkIHByb3RlY3Rpb25fbWFwW10gbmVlZG4n
dCBiZSBtb2RpZmllZCBiZWNhdXNlIHRoZSAiUE1BIgo+IHR5cGUga2VlcHMgdGhlIGhpZ2hlc3Qg
Yml0cyB6ZXJvLgo+IEFuZCB0aGUgd2hvbGUgbW9kaWZpY2F0aW9uIGlzIGxpbWl0ZWQgaW4gdGhl
IGFyY2gvcmlzY3YvKiBhbmQgdXNpbmcKPiBhIGdsb2JhbCB2YXJpYWJsZShfX3N2cGJtdCkgYXMg
X1BBR0VfTUFTSy9JTy9OT0NBQ0hFIGZvciBwZ3Byb3Rfbm9uY2FjaGVkCj4gKCZ3cml0ZWNvbWJp
bmUpIGluIHBndGFibGUuaC4gV2UgYWxzbyBhZGQgX1BBR0VfQ0hHX01BU0sgdG8gZmlsdGVyCj4g
UEZOIHRoYW4gYmVmb3JlLgo+IAo+IEVuYWJsZSBpdCBpbiBkZXZpY2V0cmVlIC0gKEFkZCAicmlz
Y3Ysc3ZwYm10IiBpbiB0aGUgbW11IG9mIGNwdSBub2RlKQo+ICAtIG1tdToKPiAgICAgIHJpc2N2
LHN2cG1idAo+IAoKSSBub3RpY2VkIHRoYXQgdGhpcyBzZXJpZXMgZ29lcyB1cCB0byB2NCBidXQg
Y2hhbmdlcyBoaXN0b3J5IGlzIG1pc3NpbmcuCldpbGwgeW91IGFkZCBpdD8KCgo+IFdlaSBGdSAo
Mik6Cj4gICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBNTVUgU3RhbmRhcmQgRXh0ZW5zaW9ucyBz
dXBwb3J0IGZvciBTdnBibXQKPiAgIHJpc2N2OiBhZGQgUklTQy1WIFN2cGJtdCBleHRlbnNpb24g
c3VwcG9ydHMKPiAKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICAg
ICAgIHwgMTAgKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9maXhtYXAuaCAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggICAg
ICAgICAgIHwgMjEgKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUt
Yml0cy5oICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKystCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrLS0tLS0K
PiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgMzUgKysr
KysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
