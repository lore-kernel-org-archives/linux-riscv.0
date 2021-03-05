Return-Path: <SRS0=jthF=ID=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B011C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF42C65017
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Mar 2021 11:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF42C65017
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ocjJAlLY/m0oSEXCXq/kt9elvb+Uwp8lOC8/I9A7+i4=; b=a3LXMxSf8Q13Q0/2G5oqz8dLh
	acU/o4dsBKPE+lcYcFUn9ok+5zLByyj2Kk+KdSR2wHYtDHF/On4LCfiUx65MsvvWGieGGQeQBno91
	COnOYmx8XzAQOpUa3gvMb26qm0H3/tpwLmWSJinBKcxRnQ1LX2UcAJQZr6M3/YXpIM3/n4q909eRx
	sbP3bUkZNF4IXAaEiY5jweqRLy/BGS1E6/AqL1FUUxDp0LZjxBpvFzFssmNvYhk++ozAC80ZPjCBv
	zzhC438rnsMo5Ebc+MjIQFEW/JrxlswMDsfJvdjb1M1gV1NwYoC9X9b8FzaO/tdUJJcK1iztMNVaj
	8lnP4PdBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI8F7-00Eg2N-3K; Fri, 05 Mar 2021 11:03:37 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI8EZ-00Efor-RS
 for linux-riscv@lists.infradead.org; Fri, 05 Mar 2021 11:03:12 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DsPsk6NggzMjRP;
 Fri,  5 Mar 2021 19:00:42 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Mar 2021
 19:02:45 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH 6/9] riscv: syscall_table: Reduce W=1 compilation warnings
 noise
Date: Fri, 5 Mar 2021 19:33:29 +0800
Message-ID: <20210305113332.428048-7-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305113332.428048-1-sunnanyong@huawei.com>
References: <20210305113332.428048-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_110304_580518_868409B0 
X-CRM114-Status: UNSURE (   5.26  )
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

QnVpbGRpbmcgcmlzY3Ygc3lzY2FsbCB0YWJsZSB3aXRoIFc9MSB0aHJvd3MgdGhlIHdhcm5pbmcg
YXMKZm9sbG93aW5nIHBhdHRlcm46CmFyY2gvcmlzY3Yva2VybmVsL3N5c2NhbGxfdGFibGUuYzox
NDozNjogd2FybmluZzogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJpZGUt
aW5pdF0KICAgMTQgfCAjZGVmaW5lIF9fU1lTQ0FMTChuciwgY2FsbCkgW25yXSA9IChjYWxsKSwK
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KLi9pbmNsdWRlL3Vh
cGkvYXNtLWdlbmVyaWMvdW5pc3RkLmg6Mjk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhfX1NZU0NBTEzigJkKICAgMjkgfCAjZGVmaW5lIF9fU0NfQ09NUChfbnIsIF9zeXMsIF9j
b21wKSBfX1NZU0NBTEwoX25yLCBfc3lzKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fgouL2luY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQu
aDozNDoxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19TQ19DT01Q4oCZCiAgIDM0
IHwgX19TQ19DT01QKF9fTlJfaW9fc2V0dXAsIHN5c19pb19zZXR1cCwgY29tcGF0X3N5c19pb19z
ZXR1cCkKICAgICAgfCBefn5+fn5+fn4KYXJjaC9yaXNjdi9rZXJuZWwvc3lzY2FsbF90YWJsZS5j
OjE0OjM2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYc3lzX2NhbGxfdGFibGVb
MF3igJkpCiAgIDE0IHwgI2RlZmluZSBfX1NZU0NBTEwobnIsIGNhbGwpIFtucl0gPSAoY2FsbCks
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCi4vaW5jbHVkZS91
YXBpL2FzbS1nZW5lcmljL3VuaXN0ZC5oOjI5OjM3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8g4oCYX19TWVNDQUxM4oCZCiAgIDI5IHwgI2RlZmluZSBfX1NDX0NPTVAoX25yLCBfc3lzLCBf
Y29tcCkgX19TWVNDQUxMKF9uciwgX3N5cykKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn4KLi9pbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvdW5pc3Rk
Lmg6MzQ6MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmF9fU0NfQ09NUOKAmQogICAz
NCB8IF9fU0NfQ09NUChfX05SX2lvX3NldHVwLCBzeXNfaW9fc2V0dXAsIGNvbXBhdF9zeXNfaW9f
c2V0dXApCiAgICAgIHwgXn5+fn5+fn5+CmFyY2gvcmlzY3Yva2VybmVsL3N5c2NhbGxfdGFibGUu
YzoxNDozNjogd2FybmluZzogaW5pdGlhbGl6ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1Xb3ZlcnJp
ZGUtaW5pdF0KLi4uCgpTaW5jZSB3ZSBpbnRlbnRpb25hbGx5IGJ1aWxkIHRoZSBzeXNjYWxsIHRh
YmxlcyB0aGlzIHdheSxpZ25vcmUgdGhlIHdhcm5pbmcuCgpSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IE5hbnlvbmcgU3VuIDxzdW5uYW55
b25nQGh1YXdlaS5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKaW5kZXggM2RjMGFiZGU5
ODhhLi42NDdhNDdmNTQ4NGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCkBAIC04LDYgKzgsNyBAQCBDRkxBR1Nf
UkVNT1ZFX2Z0cmFjZS5vCT0gJChDQ19GTEFHU19GVFJBQ0UpCiBDRkxBR1NfUkVNT1ZFX3BhdGNo
Lm8JPSAkKENDX0ZMQUdTX0ZUUkFDRSkKIENGTEFHU19SRU1PVkVfc2JpLm8JPSAkKENDX0ZMQUdT
X0ZUUkFDRSkKIGVuZGlmCitDRkxBR1Nfc3lzY2FsbF90YWJsZS5vCSs9ICQoY2FsbCBjYy1vcHRp
b24sLVduby1vdmVycmlkZS1pbml0LCkKIAogZXh0cmEteSArPSBoZWFkLm8KIGV4dHJhLXkgKz0g
dm1saW51eC5sZHMKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
