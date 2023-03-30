Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6FC761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2uNaFL0G4bG1Ge0DZxM2xxlWwBa1kjjaAWXmOj5N9M=; b=p4SvBhtNL6KqDn
	gOLLItjvc82KynWCiWA6PiS7BHKLV+uXOOZVa28dY8igzTAP4qfgnvr0w8Tdk1gNrkUmxrh0hrgXR
	fqgFc3wvps8xFAsWyDjIjQw2JD7ddB9Y/+66ClPGMApNeQBrAAF0bAxuKGnPsIiHmbj12FBdjJf/y
	dBVUq87UlqHpL7nEGTOyQSXWrYk0QXrCLT3q1+Jg8RczWoWz3Jq1kQXakij5ek2bDiheuMrt8df0Z
	5AO4GRm4WzMb3bfhrEQP9Hdmt1QGu0wYfwYgJ7Y3oT//6bGjJLHpCn07xjH1YfzhDZdfmff8eBQLL
	kNcZwvyYKbJLJYE01OYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phrbu-003lCS-1u;
	Thu, 30 Mar 2023 12:42:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phrbq-003lBh-1i
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 12:42:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2E806B82587;
	Thu, 30 Mar 2023 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3703C433EF;
	Thu, 30 Mar 2023 12:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680180147;
	bh=8ljhk+gS4RLw7KgzR295UUFEWiAH/g4lZHGORdKR5Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kxu5n2ocEgar0oYCuVKDeHs6PORlO50xNwtUxYP0rzBb+YEKi1HoeAhtNn4mIEL5H
	 ma6hZal2GJCMgVnEWoV2EhiLNU6WzPtrf48/XgFjHaqaSnJbyjWUPOhKi/2A0YKhch
	 BiN8OKj15vzmMQleKiSiMV74Y6WpyE8fsfneQKJt+6VVsI1ls0S98QCeIvMLtIGdkT
	 CskX+nYs/gspjax9puDLwqIbuCIPsLgKAPOzWWgA/B42CcxsCsokk1Dw6KO97eMIFT
	 2B2sBx20zlCdOadg4V0e5fzXfh1DuIwto+9AcIuh3UB4X1ShRhG3q2BHFdou5ZI4TT
	 6JlVwtQZioqmQ==
Date: Thu, 30 Mar 2023 13:42:21 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Message-ID: <20230330124221.GJ434339@google.com>
References: <20230322173519.3971434-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_054230_715290_0BB54D7E 
X-CRM114-Status: GOOD (  11.13  )
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

T24gV2VkLCAyMiBNYXIgMjAyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IENsZWFudXAgYmluZGlu
Z3MgZHJvcHBpbmcgdW5uZWVkZWQgcXVvdGVzLiBPbmNlIGFsbCB0aGVzZSBhcmUgZml4ZWQsCj4g
Y2hlY2tpbmcgZm9yIHRoaXMgY2FuIGJlIGVuYWJsZWQgaW4geWFtbGxpbnQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vYmluZGlu
Z3MvbWZkL2NhbmFhbixrMjEwLXN5c2N0bC55YW1sICAgICAgfCAgNiArKy0tLQo+ICAuLi4vYmlu
ZGluZ3MvbWZkL2dvb2dsZSxjcm9zLWVjLnlhbWwgICAgICAgICAgfCAyMiArKysrKysrKystLS0t
LS0tLS0tCj4gIC4uLi9tZmQvaGlzaWxpY29uLGhpNjQyMS1zcG1pLXBtaWMueWFtbCAgICAgICB8
ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9xY29tLXBtOHh4eC55YW1sICB8
ICAyICstCj4gIC4uLi9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODE1LXBtaWMueWFtbCAgICAgICB8
ICAyICstCj4gIC4uLi9iaW5kaW5ncy9tZmQvcm9obSxiZDcxODI4LXBtaWMueWFtbCAgICAgICB8
ICAyICstCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC93bGYsYXJpem9uYS55YW1sICB8
ICAyICstCj4gIC4uLi9iaW5kaW5ncy9tZmQveC1wb3dlcnMsYWMxMDAueWFtbCAgICAgICAgICB8
ICA0ICsrLS0KPiAgLi4uL2JpbmRpbmdzL21mZC94eWxvbixsb2dpY3ZjLnlhbWwgICAgICAgICAg
IHwgIDQgKystLQo+ICA5IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0
aW9ucygtKQoKSSBtYWRlIHRoZSBzdWJqZWN0IG1lc3NhZ2UgYSBsaXR0bGUgbW9yZSB1bmlxdWUg
YW5kIC4uCgpBcHBsaWVkLCB0aGFua3MKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
