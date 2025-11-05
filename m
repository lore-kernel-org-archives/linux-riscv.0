Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C16CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKb3mwEG98fuvAmg3BdP7HJF+7jM7/SzFevC84PZfvs=; b=NrWTxcDAOOYfqt
	zjJ04w7gQRx4+nSlAgVWYORLg6OCx/XTyTxCV/Yqz8nHyjkqaLpp7cSCQrIRSwl/sJ+5lG6/wVeik
	Ngtynlj0o2uGUYP9ivmVy5WKVqFN1SkR44qnok5QuNYpKvUmCSmlplpzEbfhvX+ZGlUgrIALMuAEa
	5aYLchHY2WbDZbLuKExbpBd27KKm6dscQNyFmwx3LtBjgvfKlW1/5ASCNKf9BpRExkZN9+WNWb1cq
	WSRL9Om+2uSlmkBeRQAdjZus+9Lpn4okfYGLbNvSCw3uuiGbLQiVYdyHGci++bVqo1HbVbNiBx9Gj
	WhQjGssmkU0bz8LNtnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa42-0000000DPJu-1KZq;
	Wed, 05 Nov 2025 09:44:26 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa3z-0000000DPIv-3UPa
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 09:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762335784;
	bh=2kEQYPx9izy3tjn1vebxPX+DpgkknD8cSN82ocQpSH8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fyc75V7iCHAhHUCeZSRMz9capBFlrJbfUnCvKKjL29VM1QKaAcGmmTVNF9pFRdg8j
	 O4yo6PM2cz+3yBm+kOrVMrklyjrVM/QIo2mmjR7mLiALNbFpOF9uefPZzu3qRdYC6C
	 3e1htErkZuV46k8YTevgYTEMSBI5/Vr/HA96egew=
X-QQ-mid: esmtpsz21t1762335782t549cd986
X-QQ-Originating-IP: COFdcai2DugJqSuJpc3w9T+h41iB4VKElqxx7YBkRS4=
Received: from = ( [183.48.244.102])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 17:43:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8610270425027163017
EX-QQ-RecipientCnt: 14
Date: Wed, 5 Nov 2025 17:42:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105093347.GD8064@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQV+QZoFLfkJpnMwKHMz0+6DsFjRtkr3AwqHB4mjukJMnu0qxvAQhexv
	43vnR3Z7a1tZ6caWRWMsmu917TwxQlmrscRpt5dWrs/Ng5i5MNcikee+NhIQSxaYdz4RJfd
	uCoTT0mSjeSQaExZYRuqFd7Xtb9xRvYLeDKBUBxI7mAFeehQA9wUTqoPT7L3FatNsHYlPzl
	9Al/lK3Z8G8PHI4ZwnHXqBamRzzh0QZ+g7YHnbGG4YG3s5XfLOsD6ZCelrUz26lq1Em2F26
	/ZvTK58vaf1KfTKm/iVXAA2FQrakTlSqbLPxUcYpoTFa2FwxutvyC7kZvZS9CV0/lZ1k4/P
	+VbgPG8+opYfQyGZq7DaCnl88vLJImEykUMk+22Mq9N9zqBRVxUEwexqMUshXCf2UbAKik1
	sZsO9ms+KE0mk6HkyIYFM7imRYZxRlaJL+dkzXhJLTfvP5eG3poDOp1YHrl1LLiB8jcwPqF
	rdzBOZCCtUpdjPtuna3tW6NZgogVluYeEM0hXhRtHZnTb1FcuZJDH9PICjACKMS9Xcc4rDu
	bqkfVRZEmyHj8w2XSiASSDHg2cCmAP/NMgCcRTMNT3aqPmlEUthsJlsturQwhTor+NDVAe7
	i4OSDSd+TL3p7r03sLOV6ObkZudeeFuFSUc7wOmf/eseK8kW0W7we0+r9+aCwBvSEOnmnkx
	fWXntu+tpfUgiZTWx6XEtMxQ18zFUGNDlIb0gGaxxvAI1JZar2x9KaYMrqPsVSzrBoT0044
	nUez+5xh8ZXAX9boDGhUUfSEed57QK8yunMVhD6zlOAXOvxxpRg9yuAEDtf4LVV3Laqip+7
	tPiuy6q0WPB41R9GZ04iGjZdBBFi1sJJHN1N5yiGwrNCWcm8PZNpsnrWJpKC4Ve4jes7VJx
	4818fft4cpMm9mDJQaDetdfP+Gm3yk37yo+ZzqmgWWGaqb8GRrcZiVDWDhHGj52xlXZ1YhQ
	QyZ3ZA0S6HDX2pzNDS11h8GL1WkgPeBmXCTojZfDOdCA8c6tmY3vBpM12S5jV3P02QQXhAJ
	5BAHmeLUpEhRRPPwr7oA0LZ0ptCvGInbpebVXikX11SczLjOzqpOfYrwnejYhJOniqYLP1a
	0AxkuzF5/xllgO/v4njygw9GfhLPcF7d/knPE2DvGAuZdIXfgZJNVJ/4quRBLmRxC4foSya
	ssvHvxp9g/tKBfpQq6KDxLxTHw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_014424_164932_734825D5 
X-CRM114-Status: GOOD (  14.08  )
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

T24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMDk6MzQ6MjFBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMDQgTm92IDIwMjUsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gCj4gPiBPbiBN
b24sIE5vdiAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3
cm90ZToKPiA+ID4gCj4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1
cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+IFRoaXMgYWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3Vw
cG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hpcCwgd2hpY2ggaXMKPiA+ID4gPiBjb21t
b25seSBwYWlyZWQgd2l0aCB0aGUgU3BhY2VtaVQgSzEgU29DLgo+ID4gPiA+IAo+ID4gPiA+IE5v
dGU6IEZvciByZWxpYWJsZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVuZHMgb24gYSB0aGlz
IHBhdGNoIHRoYXQgYWRkcwo+ID4gPiA+IGF0b21pYyB0cmFuc2ZlciBzdXBwb3J0IHRvIHRoZSBT
cGFjZW1pVCBJMkMgY29udHJvbGxlciBkcml2ZXI6Cj4gPiA+ID4gICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9zcGFjZW1pdC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2
QGxpbnV4LnNwYWNlbWl0LmNvbS8KXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KZGVwZW5kZW5jeSBpcyBoZXJlLgo+ID4gPiA+IAo+ID4g
PiA+IFsuLi5dCj4gPiA+IAo+ID4gPiBBcHBsaWVkLCB0aGFua3MhCj4gPiA+IAo+ID4gPiBbMS8y
XSBkcml2ZXI6IHJlc2V0OiBzcGFjZW1pdC1wMTogYWRkIGRyaXZlciBmb3IgcG93ZXJvZmYvcmVi
b290Cj4gPiA+ICAgICAgIGNvbW1pdDogMjgxMjRjYzBmYjhjN2RjMDFhNjgzNGQyMjczNTFlMjVk
OWE5MmM1OAo+ID4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8gVGhlIGRlcGVuZGVuY3kgcGF0Y2gg
aGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0Li4uCj4gCj4gV2hhdCBpcyB0aGUgZGVwZW5kZW5jeT8K
SSBwb2ludCBpdCBvdXQgYWJvdmUuCldpdGhvdXQgdGhpcyBwYXRjaCwgcmVib290IGFuZCBzaHV0
ZG93biB3b3VsZCBlbmQgdXAgY2FsbGluZyB0aGUgbm9uLWF0b21pYyBpMmNfdHJhbnNmZXIuCgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4gLS0gCj4gTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
