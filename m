Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6EAC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvvT6XJbIidoyzsLAn1bBszcceyRXSeLHpK60xyhVzQ=; b=mAfPxgsCs7gpd4
	aLOm7paz+zu6phx1qYaxk+lcv7rIchk6q9b1drHPPwVSCtZDp0t/yFpQ6eNhD9iN4Tw6n9/G3caNK
	pbeLjE7jML4HQ38TGbulKEy/1zX1VEhiC1eJQlHCjIQqf/DssArisKHmmgrkU5b1jqMVQ0j8jQxOg
	Iwb7oWzUQV8J0KRyeBjP7ICkDosFIlyjBlpl8LDUSdGZP5KNz+Is4AU2Z9tUiIxkE1Ovz/VxX2QqN
	31GaNHcmbjbCDG5XR9iNJCIAupnXSKdYJZoSIFpMdBbvtaqsLDZtWRTLgqOkfISv3km5ZmAxr+zbx
	nvx4oD08/MCNkLQru9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPE7-00DM8p-SN; Mon, 02 Jan 2023 18:07:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAn-00DL0u-0c
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:04:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9C908B80DDA;
	Mon,  2 Jan 2023 18:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AD2C433D2;
	Mon,  2 Jan 2023 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682670;
	bh=4eYs7pQIcAtCjsCXv0XY68Jnt7bhsT57ASNk+HbciSo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WYqp8Bl67P24FgUZakX+lC8wlpPHHT4udHxXh9Tv1xIqBr+BU7T2jCIwUKYl+R3Bb
	 Q9CKr4VfSMsO2rdZjJtjyBJM/ZxpeEXsqD50RNOGc/Y5G7kEtWBlFFtdYgU4Y0Kxqj
	 yH7D35TKKpdUDnkKnteNQxy68RhmEaXILW0cdnWVnoURaIDCUH3eyidkh7d2CynOi+
	 a4aEqXBqwcyJdA/EP2lMY9Bdwo8lNVLfbXo0k3dKMwkLNhYlhMjiVYhI0fCCcUFJ7q
	 RGvsqC4WwI/hVcy5NXIzPE3DmkquimZxCRNXAxgXN51FOPXOFCzZPe/bUBGjqfJfNL
	 /rMmZxiWBGQCw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 9/9] riscv/kprobe: Search free registers from unused
 caller-saved ones
In-Reply-To: <20221224114315.850130-10-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-10-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:04:28 +0100
Message-ID: <87pmbwvmmr.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100433_240086_0971BE63 
X-CRM114-Status: UNSURE (   8.89  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMvb3B0LmMKPiBpbmRleCAxYzBlOWQyMThmNmYuLjg4NGU3N2QyZGY0YyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9iZXMvb3B0LmMKPiBAQCAtMTIsNiArMTIsNyBAQAo+ICAjaW5jbHVkZSA8
YXNtL2twcm9iZXMuaD4KPiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgo+ICAjaW5jbHVkZSA8YXNt
L2FzbS1vZmZzZXRzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9leHRhYmxlLmg+Cj4gIAo+ICAjaW5j
bHVkZSAic2ltdWxhdGUtaW5zbi5oIgo+ICAjaW5jbHVkZSAiZGVjb2RlLWluc24uaCIKPiBAQCAt
MTMwLDcgKzEzMSw3IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfZGV0b3VyX2J1ZmZlcihrcHJvYmVf
b3Bjb2RlX3QgKmNvZGUsIGtwcm9iZV9vcGNvZGVfdCAqc2xvdCwKPiAgICogYXMgYSBkZXN0aW5h
dGlvbiByZWdpc3RlciBiZWZvcmUgYW55IGJyYW5jaCBvciBqdW1wIGluc3RydWN0aW9uLgo+ICAg
Ki8KPiAgc3RhdGljIHZvaWQgZmluZF9yZWdpc3Rlcih1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNp
Z25lZCBsb25nIGVuZCwKPiAtCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKndyaXRlLCB1bnNpZ25l
ZCBsb25nICpyZWFkKQo+ICsJCQkgIHVuc2lnbmVkIGxvbmcgKndyaXRlLCB1bnNpZ25lZCBsb25n
ICpyZWFkKQoKUHJvYmFibHkgYSBwYXRjaCBtZXNzdXA7IFRoaXMgbWFrZXMgdGhlIHNlcmllcyBu
byBhcHBseSBmdWxseS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
