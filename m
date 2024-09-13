Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E10FA372A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Subject:Mime-Version:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdcEaFegcdPVGI5SFrquB2SWZ43GTgH2S/Ej7KVTAJs=; b=Bcf16JX82vB1Xw
	EwCYq+luYOkrW9wiLE4HEjpCqwDlZ2bYp9+LkFFKJj0WTaXWQWGiRfTVKF9hiMFyXM6UB3Ep3kDVx
	dp1w8D52FG1GMpKl3kptvAYGeKZEGSaAjTm3d76Nt9Kcf4XaI3xg3NFRMhmKpF6Y/G02MMbH1xsAb
	jTc8jlh+V6A3KIWQEjr6GrYoHx+8Cll2MHaTlEW1jpFzMiedLrdmasl/iKTNwpwfQAtqpmcqLmrKx
	NzKdxAmPHUAM521rA7pccaqDGX3HVICcvaErIS08Z3VG8s194+LaynIN/PrGsKlxDNHM29x3mrrhe
	LWmf0OSa6FXI20SsRVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1OL-0000000FIeC-2R1U;
	Fri, 13 Sep 2024 08:10:57 +0000
Received: from out203-205-221-202.mail.qq.com ([203.205.221.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1OI-0000000FIdn-3XHF
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 08:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1726214748;
	bh=CjChXjViwq/6nV5ircW5v8CMTVCrm7D4lfk8XsXbjCQ=;
	h=From:Subject:Date:Cc:To;
	b=vxU1rvszfabN0mKl/Nb02VEt4sHSNX/b4U3gGmJMpwCgTco1z1evRXKLQXctjoDT4
	 LnLN56gQ8nuPAT25ih+jCqVwIBVAbpIVuTyVUIxZc86GcNn630id8nJ5VeYqfHTGkV
	 reHBkqzhzKZn6+x0z2kIrPll4Ua7anusYt6VYY6M=
Received: from smtpclient.apple ([96.63.209.214])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 16C1A6A7; Fri, 13 Sep 2024 16:05:44 +0800
X-QQ-mid: xmsmtpt1726214744tuf3xibd3
Message-ID: <tencent_24E1437DFC1D2BB7528A2A28D503C8033107@qq.com>
X-QQ-XMAILINFO: Mkw1Oys1xyjCGfW3uO67uf2rwUHnrD4nkDgfYQA1LJmQoViZ+a1h49+YazFvQ6
	 J8owM3ciHSMsgwJP3bvvpVLlz6HNkjDUfGUqnnE0OnCrm+fJZzS/hyxtoM+PUr9aJjMKSzCMWIn/
	 uhI5hBykqPrDwMNJtP52+pQQhSs2rFS7Hb6JPrFRz90Ge6XbHrSa6Cb3OLDFfBvr++5EK7FlYiug
	 dzCZX4/qPzJ40+1J2+BaF+thIKY2oADrsem4PsxQZyJpQzohwEkxf54a9eibAf4cdrBeK9z7wnc7
	 0QEdUVW5x3pAVxEHIO2bQvB+uSp7shcmFgMlaJcM4V0XNan3xqP1CFjdbXLz6RvLorNqljXV3yPI
	 XrZBc0twv+9aS+Gx7AOeqGlCEUDTnwaaDAQdhab3iuH2wI+aKYb2HF77jmpOSlkrDEpmPj9JLh23
	 M8N5Gv+IBkGAfia71hygB3NFOSQn4enc+OcKRw/HCyVj6L16yizYDYFYKhWPHAh+dMop2TU3VYXJ
	 z6dhwr7vdNAlq1DeZ3980DVmaTGtjPmCUxQhCC712RfAtE+NE2RYF95WTWc/QBLaFYJ9TrB25v1F
	 h2nQvUPamV/+tc7alz650gcceTlkXFFtJfEE1JXs09tSer9a/1bkIE6vGqgLAD1SjtnSP7adG5Q7
	 De8XICXvSrNIzmIyHF8w7C4ZLkCPK+5eFL0VWswJqlZXlQ3ZnLy1Ya6aMDCACasfvI52KqSSAM/c
	 raEYzO3lpFx0zb/58cWYkMXAl/lMlWBdfuA7Jj7jStNZ/dJ399wmMHYR02bzM6EckXBIDC61yYqT
	 Zzu22Zt7Sbk2TdI87xsMsFyUb6zzQlrw9tHH2cS0nhsfrcvsbYq5IMm6fsYpKjiNUcXeJNdqyben
	 iL24ULtlJy0dns9moAwTH8bxYKoJl+6LmgBQ/AYexgRTMigTMdDTS8eUyaXlem5+vaKiEbtfm/iD
	 5V9e9ZUw0=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Juhan Jin <juhan.jin@foxmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Is RISC-V Static Call worth implementing ?
X-OQ-MSGID: <BDA5A080-1B4C-4CE4-8099-6024B2B1262A@foxmail.com>
Date: Fri, 13 Sep 2024 03:05:33 -0500
Cc: peterz@infradead.org,
 jpoimboe@kernel.org,
 juhanj2@illinois.edu
To: linux-riscv@lists.infradead.org
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_011055_203062_04DF63C2 
X-CRM114-Status: UNSURE (   9.88  )
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

SGkgZm9sa3MsCgpJ4oCZbSBpbnRlcmVzdGVkIGluIGltcGxlbWVudGluZyBTdGF0aWMgQ2FsbCBm
b3IgUklTQy1WLCBhbmQgSSB3YW50IHRvCmtub3cgd2hldGhlciBpdCBpcyB3b3J0aCB0aGUgZWZm
b3J0cyB0byBpbXBsZW1lbnQgU3RhdGljIENhbGwgZm9yClJJU0MtVi4KCkluIHN1bW1hcnksIFN0
YXRpYyBDYWxsIGlzIGEgbWVjaGFuaXNtIHRoYXQgd29ya3Mgc2ltaWxhcmx5IHRvIGdsb2JhbApm
dW5jdGlvbiBwb2ludGVycy4gQSBzaW1wbGUgdXNlIGNhc2UgaXMgYXMgZm9sbG93czoKCmludCBm
dW5jX2EoaW50IGFyZzEsIGludCBhcmcyKTsKLy8gZGVmaW5lIGEgc3RhdGljIGNhbGwgbmFtZWQg
bXlfbmFtZSBwb2ludGluZyB0byBmdW5jX2EKREVGSU5FX1NUQVRJQ19DQUxMKG15X25hbWUsIGZ1
bmNfYSk7IAovLyBjYWxsIGZ1bmNfYSB0aHJvdWdoIHN0YXRpYyBjYWxsIG15X25hbWUKc3RhdGlj
X2NhbGwobXlfbmFtZSkoYXJnMSwgYXJnMik7Ci8vIG1ha2UgbXlfbmFtZSBwb2ludCB0byBhIG5l
dyBmdW5jdGlvbiBmdW5jX2IKc3RhdGljX2NhbGxfdXBkYXRlKG15X25hbWUsICZmdW5jX2IpOwov
LyBjYWxsIGZ1bmNfYgpzdGF0aWNfY2FsbChteV9uYW1lKShhcmcxLCBhcmcyKTsKClRoZSBhZHZh
bnRhZ2Ugb2YgYSBzdGF0aWMgY2FsbCBvdmVyIGEgZnVuY3Rpb24gcG9pbnRlciBpcyB0aGF0IHN0
YXRpYwpjYWxscyBhcmUgZGlyZWN0IGNhbGxzIHdoZXJlYXMgZnVuY3Rpb24gcG9pbnRlcnMgYXJl
IGluZGlyZWN0IGNhbGxzLgpPbiB4ODYsIGRpcmVjdCBjYWxscyBhcmUgbXVjaCBmYXN0ZXIgdGhh
biBpbmRpcmVjdCBjYWxscyB3aGVuIHlvdQpjb25zaWRlciBzcGVjdWxhdGlvbiBtaXRpZ2F0aW9u
IG9wdGlvbnMgc3VjaCBhcyByZXRwb2xpbmUuIFNvIFN0YXRpYwpDYWxsIGlzIG1lYW5pbmdmdWwg
YW5kIGhhcyBhbHJlYWR5IGJlZW4gaW1wbGVtZW50ZWQgZm9yIHg4Ni4KCkZvciBSSVNDLVYsIGEg
Z2VuZXJhbCBpbmRpcmVjdCBjYWxsIGlzIGxpa2UgdGhpczoKCmF1aXBjIGE1LCBpbW0KIyBsb2Fk
IHRoZSB2YWx1ZSBvZiBmdW5jdGlvbiBwb2ludGVyIGludG8gYTUKbGQgICAgYTUsIGltbShhNSkK
IyB3aXRoIHRoZSBhZGRyZXNzIG9mIHRhcmdldCBmdW5jdGlvbiBpbiBhNSwgd2UgY2FuIG5vdyBq
dW1wIHRvIGl0CmphbHIgIHJhLCAwKGE1KQoKVGhlcmUgYXJlIHR3byB2ZXJzaW9ucyBvZiBTdGF0
aWMgQ2FsbDogb3V0LW9mLWxpbmUgYW5kIGlubGluZS4gSW5saW5lCnZlcnNpb24gYnVpbGRzIG9u
IHRvcCBvZiBvdXQtb2YtbGluZSB2ZXJzaW9uLCBhbmQgaXMgZmFzdGVyIHRoYW4Kb3V0LW9mLWxp
bmUgdmVyc2lvbi4KCkZvciBhbiBvdXQtb2YtbGluZSBzdGF0aWMgY2FsbCwgdGhlIHN0YXRpYyBj
YWxsIGZpcnN0IGp1bXBzIHRvIGEKdHJhbXBvbGluZSwgdGhlbiBqdW1wcyB0byB0aGUgYWN0dWFs
IGZ1bmN0aW9uLiBUaGUgYmVzdCBhcHByb2FjaCBJIApjYW4gY29tZSB1cCB3aXRoIGlzIGEgdGhy
ZWUtaW5zdHJ1Y3Rpb24gdHJhbXBvbGluZS4gVGhyZWUgaW5zdHJ1Y3Rpb25zCnBsdXMgdHdvIGlu
c3RydWN0aW9ucyAoQVVJUEMgSkFMUikgdG8ganVtcCB0byB0aGUgdHJhbXBvbGluZSBlcXVhbHMK
Zml2ZS4KCkZpdmUgaW5zdHJ1Y3Rpb25zIHdpdGggbm8gbWVtIG9wIHZlcnN1cyB0aHJlZSBpbnN0
cnVjdGlvbnMgd2l0aCBvbmUKbWVtIG9wLiBOb3Qgc3VyZSB3aGljaCBvbmUgaXMgZmFzdGVyLgoK
Rm9yIGFuIGlubGluZSBzdGF0aWMgY2FsbCwgdGhlIHN0YXRpYyBjYWxsIGRpcmVjdGx5IGp1bXBz
IHRvIHRoZQp0YXJnZXQgZnVuY3Rpb24uIEkgZGlzY3Vzc2VkIHdpdGggUGV0ZXIgWmlqbHN0cmEs
IG9uZSBvZiB0aGUKbWFpbnRhaW5lcnMgb2YgU3RhdGljIENhbGwuIEkgZ3Vlc3Mgd2UgY2FuIHVz
ZSB0aGUgdHdvIHJlZ3VsYXIKaW5zdHJ1Y3Rpb25zIEFVSVBDIGFuZCBKQUxSIHRvIGp1bXAgdG8g
YSB0YXJnZXQgZnVuY3Rpb24uCgpUd28gaW5zdHJ1Y3Rpb25zIHdpdGggbm8gbWVtIG9wIHZlcnN1
cyB0aHJlZSBpbnN0cnVjdGlvbnMgd2l0aCBvbmUgbWVtCm9wLiBBbiBpbmxpbmUgc3RhdGljIGNh
bGwgc2hvdWxkIGJlIGZhc3RlciB0aGFuIGFuIGluZGlyZWN0IGNhbGwuCgpEb2VzIHRoZSBhZm9y
ZW1lbnRpb25lZCBiZW5lZml0cyBtZXJpdCBhIFJJU0MtViBzdGF0aWMgY2FsbCBpbXBsZW1lbnRh
dGlvbiAKKGVzcGVjaWFsbHkgaW5saW5lKT8gT3IgYXJlIHRoZSBiZW5lZml0cyBzbyBuZWdsaWdp
YmxlIHRoYXQgaXTigJlzIHNpbXBseSBub3QgCndvcnRoIHRoZSBlZmZvcnQgdG8gZG8gYSBSSVND
LVYgaW1wbGVtZW50YXRpb24/CgpJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB1cGRhdGluZyBhIHN0
YXRpYyBjYWxsIGlzIG11Y2ggbW9yZSB0cm91Ymxlc29tZQp0aGFuIHVwZGF0aW5nIGEgZnVuY3Rp
b24gcG9pbnRlci4gU28gc3RhdGljIGNhbGxzIGFyZSBzdWl0YWJsZSB0bwpyZXBsYWNlIGZ1bmN0
aW9uIHBvaW50ZXJzIHRoYXQgZG9u4oCZdCBjaGFuZ2Ugb2Z0ZW4uIE9uZSBzY2VuYXJpbyBpcwp0
cmFjZXBvaW50cy4gV2l0aCBpbmxpbmUgc3RhdGljIGNhbGxzLCBSSVNDLVYgdHJhY2Vwb2ludCBw
ZXJmb3JtYW5jZQpzaG91bGQgaW1wcm92ZS4gTm90IHN1cmUgYnkgaG93IG11Y2gsIHRob3VnaC4K
IApCZXN0LApKdWhhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
