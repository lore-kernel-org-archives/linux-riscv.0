Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7AFC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zs8DRGIHS4sKJp9I7YthFjTP+YpT+ZMayeWP8Bwv1BQ=; b=l3H1/Kj7puXwAw
	mvrHZOwbD5xMEDNBTrj7qaXvJC2tSQf6IUYPUfFvwj//U4vcUFmsIiVRClnQTOLEXmg9LiKGuUWlW
	u03PJ4atNXh1nVPi2JPjrZ965YMkrqsHvvzj3K2+mfVR/AEZsx38sIhFvpc06exwCMMxLYtP0aUfO
	9qPYyjarZZj/NcQQdzwb7+GAMqLMffiMuuBz5L6eRN9F0eLEWBLSRuX0mjTappR0I70YPc0xSKqpf
	nWXclNmkO80uH9cC4Dv3TchmNsLdEjAWciBkV/Ff/Tw9jYYt1y+saT7Up3N4ehqCMgnENRTZqna3W
	IeOOiwoZjhTImYrffbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U0a-001Cyl-2v;
	Tue, 06 Jun 2023 10:33:48 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6U0X-001Cvt-3A
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 10:33:48 +0000
X-QQ-mid: bizesmtp77t1686047606txn7aw4u
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 18:33:24 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: hoArX50alxGkbZTorGfzuE9D/zkJ22QpJbBObxxDyv0ziBc3Uny1TtpehSPgD
	EV9ER9LFSBjaKelNlzT5ueaWST+tVc2F5H54q4YXLk1h+ouDidqVbK9i/U9tEQQM9XQrexW
	31V6Fj6BDfnvFRy/HaByNdKUdhlwSlj2RV3eHb100GFaqd3gg+pdyJhcLgzuVCbFRQkftB/
	0Y8oA4kfgDF58mpXwJ0nOt56pYD8RJQukuAKNjixoYdwwNfaqbYFk7/ynsM4QPxjTiqUcpF
	TywG3TQU3Eg5NSbXvmiz0DehrLc7M0ArDdG1e2JDiSOt4tqE/JaL4Y6HI2k1Bwbfa80d2ou
	Id/JiMfefNvZGwfUZugWBk1CPqyaTWJG01kV4Ua6nU1VuIR+fBZrP2kBTYbRjd8uj8a5N/G
	faR5YvZJ7+s=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6183842008970657575
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	thomas@t-8ch.de
Subject: [PATCH v2 1/4] tools/nolibc: sys.h: add __syscall() and __sysret() helpers
Date: Tue,  6 Jun 2023 18:33:24 +0800
Message-Id: <20230606103324.512531-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
References: <a42fb9e1bbe0daf7d8a48ea8f44135ef851030d7.1686036862.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033346_357390_B977B01C 
X-CRM114-Status: GOOD (  21.70  )
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

PiBtb3N0IG9mIHRoZSBsaWJyYXJ5IHJvdXRpbmVzIHNoYXJlIHRoZSBzYW1lIGNvZGUgbW9kZWws
IGxldCdzIGFkZCB0d28KPiBoZWxwZXJzIHRvIHNpbXBsaWZ5IHRoZSBjb2RpbmcgYW5kIHNocmlu
ayB0aGUgY29kZSBsaW5lcyB0b28uCj4gCj4gT25lIGFkZGVkIGZvciBzeXNjYWxsIHJldHVybiwg
b25lIGFkZGVkIGZvciBzeXNjYWxsIGNhbGwuCj4gCj4gVGhvbWFzIHN1Z2dlc3RlZCB0byB1c2Ug
aW5saW5lIGZ1bmN0aW9uIGluc3RlYWQgb2YgbWFjcm8gZm9yIF9fc3lzcmV0KCksCj4gYW5kIGhl
IGFsc28gaGVscGVkIHRvIHNpbXBsaWZ5IHRoZSBfX3N5c2NhbGwoKSBhIGxvdC4KPiAKPiBXaWxs
eSBzdWdnZXN0ZWQgdG8gbWFrZSBfX3N5c3JldCgpIGJlIGFsd2F5cyBpbmxpbmUuCj4gCj4gU3Vn
Z2VzdGVkLWJ5OiBXaWxseSBUYXJyZWF1IDx3QDF3dC5ldT4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi9aSDEraGtoaUEyK0l0U3ZYQDF3dC5ldS8KPiBTdWdnZXN0
ZWQtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9lYTRlNzQ0Mi03MjIzLTQyMTEtYmEy
OS03MDgyMWU5MDc4ODhAdC04Y2guZGUvCj4gU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZh
bGNvbkB0aW55bGFiLm9yZz4KPiAtLS0KPiAgdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggfCAx
MiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmggYi90b29scy9pbmNsdWRlL25v
bGliYy9zeXMuaAo+IGluZGV4IDU0NjRmOTNlODYzZS4uYzEyYzE0ZGIwNTZlIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9ub2xp
YmMvc3lzLmgKPiBAQCAtMjgsNiArMjgsMTggQEAKPiAgI2luY2x1ZGUgImVycm5vLmgiCj4gICNp
bmNsdWRlICJ0eXBlcy5oIgo+ICAKPiArLyogU3lzY2FsbCByZXR1cm4gaGVscGVyLCBzZXQgZXJy
bm8gYXMgLXJldCB3aGVuIHJldCA8IDAgKi8KPiArc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9f
KChhbHdheXNfaW5saW5lKSkgbG9uZyBfX3N5c3JldChsb25nIHJldCkKClNvcnJ5LCB0aGUgcnVu
LXVzZXIvcnVuIHRhcmdldHMgaW4gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL01ha2Vm
aWxlCmNvbXBsYWlucyBhYm91dCB0aGUgYWJvdmUgbGluZSwgc2VlbXMgaXQgZG9lc24ndCBzdXBw
b3J0IHRoZSAnaW5saW5lJyBrZXl3b3JkCmFuZCByZXF1aXJlcyAnX19pbmxpbmVfXycuCgpKdXN0
IGNoZWNrZWQgbXkgb3duIHRlc3Qgc2NyaXB0IGFuZCB0aGUgcnVuLXVzZXIgLyBydW4gdGFyZ2V0
cywgdGhlIG9ubHkKZGlmZmVyZW5jZSBpcyBpdCBmb3JjZWx5IHVzZXMgLXN0ZD1jODksIGRvIHdl
IG5lZWQgdG8gYWxpZ24gd2l0aCB0aGUga2VybmVsCk1ha2VmaWxlIGFuZCB1c2UgLXN0ZD1nbnUx
MSBpbnN0ZWFkPwoKV2hhdGV2ZXIsIEkgbmVlZCB0byBjaGFuZ2UgdGhpcyBsaW5lIHRvIGFsaWdu
IHdpdGggdGhlIG90aGVyIGNvZGVzLCB1c2UKX19pbmxpbmVfXyBhcyB3ZSBoYXZlIHVzZWQgaW4g
dG9vbHMvaW5jbHVkZS9ub2xpYmMvc3RkbGliLmg6CgogICAgZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
Y2x1ZGUvbm9saWJjL3N5cy5oIGIvdG9vbHMvaW5jbHVkZS9ub2xpYmMvc3lzLmgKICAgIGluZGV4
IDBjZmM1MTU3ODQ1YS4uNDgzNjUyODhhOTAzIDEwMDY0NAogICAgLS0tIGEvdG9vbHMvaW5jbHVk
ZS9ub2xpYmMvc3lzLmgKICAgICsrKyBiL3Rvb2xzL2luY2x1ZGUvbm9saWJjL3N5cy5oCiAgICBA
QCAtMjksNyArMjksOCBAQAogICAgICNpbmNsdWRlICJ0eXBlcy5oIgogICAgIAogICAgIC8qIFN5
c2NhbGwgcmV0dXJuIGhlbHBlciwgc2V0IGVycm5vIGFzIC1yZXQgd2hlbiByZXQgPCAwICovCiAg
ICAtc3RhdGljIGlubGluZSBfX2F0dHJpYnV0ZV9fKChhbHdheXNfaW5saW5lKSkgbG9uZyBfX3N5
c3JldChsb25nIHJldCkKICAgICtzdGF0aWMgX19pbmxpbmVfXyBfX2F0dHJpYnV0ZV9fKCh1bnVz
ZWQsIGFsd2F5c19pbmxpbmUpKQogICAgK2xvbmcgX19zeXNyZXQobG9uZyByZXQpCiAgICAgewog
ICAgICAgICAgICBpZiAocmV0IDwgMCkgewogICAgICAgICAgICAgICAgICAgIFNFVF9FUlJOTygt
cmV0KTsKCkJlc3QgcmVnYXJkcywKWmhhbmdqaW4KCj4gK3sKPiArCWlmIChyZXQgPCAwKSB7Cj4g
KwkJU0VUX0VSUk5PKC1yZXQpOwo+ICsJCXJldCA9IC0xOwo+ICsJfQo+ICsJcmV0dXJuIHJldDsK
PiArfQo+ICsKPiArLyogU3lzY2FsbCBjYWxsIGhlbHBlciwgdXNlIHN5c2NhbGwgbmFtZSBpbnN0
ZWFkIG9mIHN5c2NhbGwgbnVtYmVyICovCj4gKyNkZWZpbmUgX19zeXNjYWxsKG5hbWUsIC4uLikg
X19zeXNyZXQoc3lzXyMjbmFtZShfX1ZBX0FSR1NfXykpCj4gIAo+ICAvKiBGdW5jdGlvbnMgaW4g
dGhpcyBmaWxlIG9ubHkgZGVzY3JpYmUgc3lzY2FsbHMuIFRoZXkncmUgZGVjbGFyZWQgc3RhdGlj
IHNvCj4gICAqIHRoYXQgdGhlIGNvbXBpbGVyIHVzdWFsbHkgZGVjaWRlcyB0byBpbmxpbmUgdGhl
bSB3aGlsZSBzdGlsbCBiZWluZyBhbGxvd2VkCj4gLS0gCj4gMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
