Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A5606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ca4zvb+q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=dxBPOEcT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EiqUfAomXvEt/Oz2UmBDktDBkcvzOCQbXMz/oM8yQiI=; b=Ca4zvb+qjmag/vwv61c2nFe833
	DxVZ69KpDEXqK9t2IQSm3fA+Yh0NV8WbqX4KbbqeERN7Tee0triom369iE7W7Yy8nrlDfNdkbFPT5
	/OUBKawl8SJ9EDWjaZhI9Z2akiXBQee9xk7TEOCpmxo2lVsJNgBO/oH2izgTDpCNylhA64xrExMfA
	yiDGDQuOEZLkgipZ6QzuB6Y8ArT1PMlX06Mc/55JnUflXg1rL7S3FMUx3Xo+KGiS3TQqnU/6ZWhVr
	RV4M3nUXiUfgA7juuMBs3XHC8izKqQLM7gUXO4Uge73J3CnrF3AKy4uavv6sjvWeNafF2dfWPYhQS
	Y8vzxkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQzq-00000002uPT-183S;
	Mon, 23 Nov 2026 10:10:02 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQzm-00000002uKd-0Cdt
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 10:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795428544;
	bh=na+Qx5lxtdWvhLfCjtLB7gxG8BYD2XnZIK8peOF3Fyg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=dxBPOEcT822N9MS9+7+GDLXAz0TzccONkfaGXR7+gWQjIAPSzqiuxM1TR3UhG2jkR
	 cwOE0aOcxn4dulG93a3CP/ghSNnpjVqzFm20iJBaB5NMLGNLqrXrs82bt3YOBp5lgn
	 41LtHZxS5d5a1cLAuWBGP3DCzGaFVAURceEYZCbY=
X-QQ-mid: esmtpsz21t1795428537t55d3ec12
X-QQ-Originating-IP: YRM8rmCD4m2EOmelJpoSAkd6C+Zo71Ofh6RWgSJHJN0=
Received: from localhost ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 18:08:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6646035375502222729
EX-QQ-RecipientCnt: 19
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 23 Nov 2026 18:08:54 +0800
Message-Id: <DN2IAQ05SK22.2BFO0AZF4IAH6@linux.spacemit.com>
Cc: "alessio.belle" <alessio.belle@imgtec.com>, "luigi.santivetti"
 <luigi.santivetti@imgtec.com>, "maarten.lankhorst"
 <maarten.lankhorst@linux.intel.com>, "mripard" <mripard@kernel.org>,
 "tzimmermann" <tzimmermann@suse.de>, "airlied" <airlied@gmail.com>,
 "simona" <simona@ffwll.ch>, "dlan" <dlan@kernel.org>, "troy.mitchell"
 <troy.mitchell@linux.spacemit.com>, "pjw" <pjw@kernel.org>, "palmer"
 <palmer@dabbelt.com>, "aou" <aou@eecs.berkeley.edu>, "alex"
 <alex@ghiti.fr>, "imagination" <imagination@lists.freedesktop.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "linux-riscv"
 <linux-riscv@lists.infradead.org>, "spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] drm/imagination: re-check firmware idle state before
 runtime suspend
From: "Baihui Liang" <liangbaihui@linux.spacemit.com>
To: "Gyeyoung Baek" <gye976@gmail.com>
X-Mailer: aerc 0.17.0
References: <20261111-img-pm-autosuspend-v2-1-427689f6f2f9@linux.spacemit.com> <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
In-Reply-To: <CAKbEzntsUc4D3Nvxfphy5yApWG+sGsx7VF1cYd3SLSoZKhiteA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OKrvsjP4PrxvitNSYHKY3k1dVsxkzvcI7C2b1nwa+lhfvt0cyA90Rixi
	+Z25tPoHkzZGBI92vYs8iTv9bh5x74iSpIhyPAIM4EWr1wnY6lqHC4Kaq/eafPv9gsbOi7g
	DjYqsNPZCHzvDaieFPCvo2WsE/zTp2xVrVnn93Y2l7Dc5TS4WM0jWKZD2UqAlBhT48WtWd8
	bXUloIHfss5sRQ+yFRzr6o5ECDglT41kc6yCZdbASRKZmhNiir91LirJBsqLBs7BF28R0/S
	Ao2eJOv6ye4u8wiL+tNmCHxedAvWTZ3jAr2X0gMqnXlneUWXKMdD1znZExB4e8CM+lSI9JZ
	pXEzZ7nDC6EJGRoaM1wBhmhqLf4W6ocPyl54LsS65sToMXlPVe09453UVba4MpGAcOtNHAM
	au6EHGDCIUBSXpdcDFtZoU4L+r/ir/MhCI5WlTxMskdNHrJkxqQHoUZsAEqLL9UlzZse0bS
	2wpp0K4i+STC8XmWlEojN4QY5qdtG9OdFSA/LCHrc9dc/V/7Xdh3qE792YYIn9vRF2Pz7Cy
	KxqoABXb4p2AceVCNVgtSimAQ4Mri743Cx96KulVe0J5gscKYi7YF90WsBACHPGd9sCe8Cm
	xNPm//PVImtyQ0gNRIl6LYN+SHk0bU8rtFd7Bx10qpvbHfbwKR6Sw2HIRkkAoyas9O3WHnb
	nRypopyu/MRq9QU+XJvjHGiEfvw7b92DrEpA/u1ETuUdjFfCsULvgCALaE6L6ZASMWHAHUL
	r663OuLG1vW9fUKAz4lwANJw1hN3x04BCCRH8+LKaQUHdigj495AHRz0xksFEcxmfTDw5Ur
	DYYZnse6hsbBUjyel+2/ZS/hx+2JfI3ruwXSoPDJPABySxTEbdHPfZVMXr4Urs3WzMAnJXV
	7hfDE9F/WocYwclayTvu2CgaVQ/Cs0Q5bQyA9Lyf/oV/9RnL0ZDsAUjIL+jDz1kzVXvgkoD
	evlgocu8998inPdwybGYW6cKq8P0Yn/hN841T7BfjzQCbV3hcP5XVGIXcYBIGL7TcQsbjnj
	Cx3zG29rUwf+udkb8lZgds1X2kvWot/ZQss9sYHXwRSPZVsEpV
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020958_954398_E39F30A9 
X-CRM114-Status: GOOD (  13.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuIE5vdiAyMiwgMjAyNiBhdCAxOjU3IEFNIENTVCwgR3lleW91bmcgQmFlayB3cm90ZToK
PiBIaSBCYWlodWksCj4KPiBPbiBXZWQsIE5vdiAxMSwgMjAyNiBhdCA2OjI54oCvUE0gQmFpaHVp
IExpYW5nCj4gPGxpYW5nYmFpaHVpQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPgo+ID4g
cHZyX3Bvd2VyX2RldmljZV9pZGxlKCkgcmVqZWN0cyBydW50aW1lIHN1c3BlbmQgd2hpbGUgdGhl
IGZpcm13YXJlCj4gPiBoYXNuJ3QgcmVhY2hlZCBST0dVRV9GV0lGX1BPV19JRExFLiBUaGUgUE0g
Y29yZSBkb2Vzbid0IHJlc2NoZWR1bGUKPiA+IGlkbGUgbm90aWZpY2F0aW9uIGFmdGVyIHJlamVj
dGlvbiwgc28gbm8gZnVydGhlciBwbV9ydW50aW1lX3B1dCgpCj4gPiBhcnJpdmVzIG9uIGFuIGlk
bGUgR1BVIGFuZCB0aGUgZGV2aWNlIHN0YXlzIHBvd2VyZWQgaW5kZWZpbml0ZWx5Lgo+ID4KPiA+
IE1vdmUgdGhlIGlkbGUgY2hlY2sgaW50byBwdnJfcG93ZXJfZGV2aWNlX3N1c3BlbmQoKSBhbmQg
cmV0dXJuIC1FQlVTWQo+ID4gYWZ0ZXIgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHNvIHRo
ZSBQTSBjb3JlIHJlc2NoZWR1bGVzIHRoZQo+ID4gYXV0b3N1c3BlbmQgdGltZXIgYW5kIHJldHJp
ZXMgdW50aWwgdGhlIGZpcm13YXJlIGlzIGlkbGUuCj4KPiBNeSB1bmRlcnN0YW5kaW5nIG9mIFNh
c2hpa28ncyBwb2ludCAoY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcpOgo+Cj4gLSBwdnJfcmVtb3Zl
KCk6IG11c3QgcG93ZXIgb2ZmIHVuY29uZGl0aW9uYWxseQo+IC0gcnVudGltZSBzdXNwZW5kOiBw
b3dlciBvZmYgb25seSBvbmNlIGlkbGUgKC1FQlVTWSBvdGhlcndpc2UpCj4KPiBTaW5jZSByZW1v
dmUgZ29lcyB0aHJvdWdoIHRoZSBzdXNwZW5kIGNhbGxiYWNrLCBpdCBjYW4gbm93IHNraXAgdGhl
Cj4gcG93ZXItb2ZmIG9uIC1FQlVTWS4KCkV4YWN0bHkgcmlnaHQuCgo+IE1vdmluZyB0aGUgaWRs
ZSBjaGVjayBpbnRvIHJ1bnRpbWUgc3VzcGVuZCBsb29rcyByaWdodCB0byBtZSwgc28gaG93Cj4g
YWJvdXQga2VlcGluZyBqdXN0IHRoZSBwb3dlci1vZmYgbG9naWMgaW4gYSBjb21tb24gaGVscGVy
LCBjYWxsZWQgYnkKPiBydW50aW1lIHN1c3BlbmQgYWZ0ZXIgdGhlIGlkbGUgY2hlY2sgYW5kIGJ5
IHJlbW92ZSBkaXJlY3RseT8gUm91Z2hseToKPgo+ICAgcHZyX3Bvd2VyX2RldmljZV9vZmYoKSAg
ICAgICAgLyogZndfZGlzYWJsZSArIHBvd2VyX29mZiAqLwo+Cj4gICBwdnJfcmVtb3ZlKCkKPiAg
ICAgICBwbV9ydW50aW1lX2Rpc2FibGUoKTsKPiAgICAgICBpZiAoIXBtX3J1bnRpbWVfc3RhdHVz
X3N1c3BlbmRlZCgpKSB7Cj4gICAgICAgICAgIHB2cl9wb3dlcl9kZXZpY2Vfb2ZmKCk7Cj4gICAg
ICAgICAgIHBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgpOwo+ICAgICAgIH0KPiAgICAgICBwbV9y
dW50aW1lX2VuYWJsZSgpOyAgICAgIC8qIGJhbGFuY2UgZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgp
ICovCgpBZ3JlZWQg4oCUIHRoYXQncyB0aGUgc2hhcGUgSSBlbmRlZCB1cCB3aXRoOiBhIGNvbW1v
biBwb3dlci1vZmYgaGVscGVyIGNhbGxlZCBmcm9tIHJ1bnRpbWUgc3VzcGVuZCBhZnRlciB0aGUg
aWRsZSBjaGVjaywgYW5kIGZyb20gcHZyX3JlbW92ZSgpIHdpdGggcnVudGltZSBQTSBkaXNhYmxl
ZCBhcm91bmQgaXQuCgpUaGFua3MsCkJhaWh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
