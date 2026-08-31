Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB302C61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTpTG9UZ+5P8KiBcJXjYxEuxv6P+tpbzpDf2WIXzxhA=; b=nuUSJF85fO31RK
	XRtAjtZosjEr0Eg+yvaII5jx0YRS9WhvQ6leK3Rr3CRlvy5R04ZwgnW3dE++/jLDoxB0q30aUshvF
	kajYBXS54VpKWTBDp1TyuZ/mj6E1ea8zCaA0IYac9ShLp/ibHhHdL+eMC9rvbTsB99WmUhFM74hoa
	zJYybqLWq94yxuImxrPALM5X/ebdUIuGE5MDvsUDtjyBu4VskEUj3uPJrhqhgVn94O6KWdnxSYEZU
	BTVV0p0XAO07Iqa1LOS4sAkuJB0IXi3Rlp1DlInoezxzgsKyOWAoUq39O/+a9zOwaOPvxLgnfE63k
	oX7n5rtYrL3/i8z2FqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rZd-00000008LhK-24ph;
	Mon, 31 Aug 2026 02:16:37 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0rZZ-00000008Lfi-3lJP
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 02:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788142587; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=b65atCeqRmyp6gckV4T+CsR2JdFsS1TQtr21uHemmiY=;
	b=ukubjon1VIMbuZuBo7mBZFpLEDtrYBO5XJ9UghETOg5QbbDnvszKuaeq1KZgxETm+lInUzpyzllmU/bfb2zIxyWCyUtjpwlH0qpfRks8rcC8SWy4ogIcrY1UiHOTrtD5BvaJbrJReKWxtZ7EdLDGIesJVsYVBB/iJhtg4YO+w7o=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X9rz36c_1788142580;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9rz36c_1788142580 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 10:16:25 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	devicetree@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Date: Mon, 31 Aug 2026 10:16:16 +0800
Message-ID: <20260831100216.reply.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_191634_254929_A8CF939D 
X-CRM114-Status: UNSURE (   8.24  )
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

SGkgRHJldywKClRoYW5rcyBmb3Iga2VlcGluZyB0aGlzIHNlcmllcyBhbGl2ZS4gV2hpbGUgdGVz
dGluZyB2NiBvbiBhIFJJU0MtVgpwbGF0Zm9ybSB3aXRoIGEgQ0JRUkkgY2FwYWNpdHkgY29udHJv
bGxlciAoOCBjYXBhY2l0eSBibG9ja3MgYmFja2luZwpvbmUgTDMsIFNzcW9zaWQgKyBDQlFSSSBl
eHBvc2VkIHZpYSBEVCksIEkgaGl0IGEgcHJvYmxlbSB0aGF0IHRyYWNlcwpiYWNrIHRvIHRoaXMg
cGF0Y2g7IGZpbmRpbmdzIGFuZCBhIHN1Z2dlc3RlZCBmaXggYmVsb3cuCgpTeW1wdG9tCi0tLS0t
LS0KV2l0aCB0aGUgc2VyaWVzIGFwcGxpZWQsIHRoZSByZXNjdHJsIGludGVyZmFjZSByZXBvcnRz
IGFuIGVtcHR5CmNhcGFjaXR5IG1hc2sgZXZlcnl3aGVyZToKCiAgIyBjYXQgL3N5cy9mcy9yZXNj
dHJsL2luZm8vTDMvY2JtX21hc2sKICAwCiAgIyBjYXQgL3N5cy9mcy9yZXNjdHJsL3NjaGVtYXRh
CiAgTDM6MD0wCiAgIyBjYXQgL3N5cy9mcy9yZXNjdHJsL3NpemUKICBMMzowPTAKCndoaWxlIHRo
ZSBoYXJkd2FyZSByZXBvcnRzIE5DQkxLUz04IGluIHRoZSBDQyBjYXBhYmlsaXRpZXMgcmVnaXN0
ZXIKKGJpdHNbMjM6OF0gb2YgY2NfY2FwYWJpbGl0aWVzLCBwZXIgQ0JRUkkgdjEuMCDCpzMuNSks
IGkuZS4gdGhlCmV4cGVjdGVkIHZhbHVlcyBhcmUgY2JtX21hc2s9ZmYgLyBMMzowPWZmLgoKUm9v
dCBjYXVzZQotLS0tLS0tLS0tCmNicXJpX3Jlc2N0cmxfY29udHJvbF9pbml0KCkgZmlsbHMgY2Jt
X2xlbi9zaGFyZWFibGVfYml0cy9taW5fY2JtX2JpdHMKYnV0IG5ldmVyIGluaXRpYWxpemVzIHJl
cy0+ZGVmYXVsdF9jdHJsLCB3aGljaCB0aGVyZWZvcmUgc3RheXMgMAooc3RhdGljIHN0b3JhZ2Up
OgoKPiArc3RhdGljIGludCBjYnFyaV9yZXNjdHJsX2NvbnRyb2xfaW5pdChzdHJ1Y3QgY2Jxcmlf
Y2FjaGUgKmN0cmwsCj4gKwkJCQkgICAgICBzdHJ1Y3QgcmR0X3Jlc291cmNlICpyZXMpCj4gK3sK
PiArCXJlcy0+bmFtZSA9IGthc3ByaW50ZiguLi4pOwo+ICsJcmVzLT5jYWNoZS5jYm1fbGVuID0g
Y3RybC0+Y2MubmNibGtzOwo+ICsJcmVzLT5jYWNoZS5zaGFyZWFibGVfYml0cyA9IDA7Cj4gKwku
Li4KClR3byB2aXNpYmxlIGNvbnNlcXVlbmNlcywgYm90aCBtYXRjaGluZyB0aGUgc3ltcHRvbSBl
eGFjdGx5OgoKMS4gaW5mby9MMy9jYm1fbWFzayBpcyBhIGRpcmVjdCB2aWV3IG9mIHItPmRlZmF1
bHRfY3RybAogICAocmR0X2RlZmF1bHRfY3RybF9zaG93KCkpLCBoZW5jZSAwLgoyLiBjYnFyaV9p
bml0X2RvbWFpbl9jdHJsdmFsKCkgc2VlZHMgZXZlcnkgUkNJRCdzIENPTkZJR19MSU1JVCBmcm9t
CiAgIHJlc2N0cmxfZ2V0X2RlZmF1bHRfY3RybCgpLCBpLmUuIGl0IHByb2dyYW1zIGEgemVybyBj
YXBhY2l0eSBtYXNrCiAgIGZvciBhbGwgUkNJRHMgKGluY2x1ZGluZyBSQ0lEIDAgdXNlZCBieSBh
bGwgaGFydHMgYnkgZGVmYXVsdCk7IHRoZQogICBoYXJkd2FyZSB0aGVuIHJlYWRzIGJhY2sgMCwg
aGVuY2Ugc2NoZW1hdGEvc2l6ZSBzaG93IEwzOjA9MC4KCkZvciBjb21wYXJpc29uLCB0aGUgeDg2
IHJlc2N0cmwgY29kZSBpbml0aWFsaXplcyB0aGUgZGVmYXVsdCB0byB0aGUKZnVsbCBtYXNrIChh
cmNoL3g4Ni9rZXJuZWwvY3B1L3Jlc2N0cmwvY29yZS5jOiByLT5kZWZhdWx0X2N0cmwgPQptYXhf
Y2JtKSwgYW5kIGFuIGVhcmxpZXIgb3V0LW9mLXRyZWUgUklTQy1WIENCUVJJIGltcGxlbWVudGF0
aW9uIGRpZAp0aGUgZXF1aXZhbGVudCAocmVzLT5kZWZhdWx0X2N0cmwgPSBCSVRfTUFTSyhuY2Js
a3MpIC0gMSkuIEl0IGxvb2tzCmxpa2UgdGhhdCBpbml0aWFsaXphdGlvbiB3YXMgbG9zdCBpbiB0
aGUgcmV3b3JrLgoKU3VnZ2VzdGVkIGZpeAotLS0tLS0tLS0tLS0tCkluaXRpYWxpemUgdGhlIGRl
ZmF1bHQgY29udHJvbCB0byB0aGUgZnVsbCBjYXBhY2l0eSBtYXNrIGluCmNicXJpX3Jlc2N0cmxf
Y29udHJvbF9pbml0KCksIGUuZy46CgoJcmVzLT5kZWZhdWx0X2N0cmwgPSBCSVRfTUFTSyhjdHJs
LT5jYy5uY2Jsa3MpIC0gMTsKCnJpZ2h0IGFmdGVyIHJlcy0+Y2FjaGUuY2JtX2xlbiBpcyBzZXQu
IFdpdGggdGhpcyBvbmUgbGluZSwgY2JtX21hc2sKc2hvd3MgZmYsIHNjaGVtYXRhL3NpemUgc2hv
dyBMMzowPWZmLCBhbmQgd3JpdGluZyBzY2hlbWF0YSByb3VuZC10cmlwcwpjb3JyZWN0bHkuCgpC
ZXN0IHJlZ2FyZHMsClBlaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
