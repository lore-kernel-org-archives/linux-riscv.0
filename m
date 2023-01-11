Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7608BC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5Q/MsZYSnhZB9hTqF1CAk5Z7ca4UnbyJmWpD63cAJY=; b=269akNfMnS7fFmQOJ6Lvuih6xz
	owYgRvz0dKLlqI0J7If63ubF0JjGYmOvaOEcesJnI9dxxgpmrzTrrw6/0lGu4TIwaWptRsiSp826k
	OZtpMUUVGqC12j+2Rqv9hmkNN5Z53+2bO8sxBXhhAuULx3X/1TDktwBRFW3SHviRLMLsKM6pxSYly
	MfFbcYgmdEIb/sxWyht37BhnHwGyAOpnebCU5hcPMsb/XSa95ODXDC5s/u5Cv1v9BRXDumULxPFWv
	ltbbKfY42we5X3trIRXQ+WVSDIh975CYTfy5GZlF0msQnQV/MIzc8Q/rZWns+3w+grDIbFAD/QYwA
	Dc5uG7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcvh-00ByhW-Uf; Wed, 11 Jan 2023 15:22:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFcve-00Bygq-Ml
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 15:22:16 +0000
Received: by mail-pj1-x102b.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso20423527pjt.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 07:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T01kouKnZuH8H6ryTAdK1c2OSYz3SNGPd9CAkOV3vfg=;
        b=oh5Yz+WuxWqjeZkpSuNoMxiTjGgCuZ2dwD9Qkq7lmJy35C40MGW8WBLIakLoySJilH
         XqPe56JGYAQ2avvWK+4SYH4BSprXhVdJ7rPvfyK3L7XII6OEQEYMHAoQdPB30+euC1ni
         hMm8VBNczJXgMnoDblNjsSFQY1hkhHurloOcuFpzJqKSyMNloqxpI/GnHUmrjJLdaMb3
         HDJoUWRRf/4Vwpc7P4nCOIZSHtUsOcpBGjOVQCikBppI5GaN2ZNwIyV7FowS+BL7J/0R
         FjS0iHiEeCLLws5zLz6J0QJwcwsmJ6y8NzMbAdX3NYDwQM386CbqhkcfXEGyVazHqLYe
         BKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T01kouKnZuH8H6ryTAdK1c2OSYz3SNGPd9CAkOV3vfg=;
        b=VgOOPw0Uqh5StNQU6i1SVnExu3QUPyHO7sw/yJbG1y7Jx36170Zpvp/w4snzqMPvlX
         KaHtGnasednaJltvLND3fw4MvjPCOTA9ONgeRoiaOj8u0qnNGY0eAABrzdceFPqYaOoH
         nO37dgPb9NsDJHlTSOFDqMZe47+LTe8yAw3tzw9wj1dUfznIAVuy9lGLdRM25ZL9Bjv9
         1LMV19ImUqU9+OOKv7udyCDiYaWsgSwix+IQ/37+1aee8zhQND5o2UxGekJFlVoa3eSu
         E9vRH+vmZKhfJ7g6mJpk8QvQxktD4F9WjrP0wfLGnAulZOQKl6gf713oEybyx3fQ6dao
         P6Ag==
X-Gm-Message-State: AFqh2krp6QtIeVYhqt1IW3eS+/64xMPBcu82gB7SuO8GLTunPQDrV/aO
	WxOCIXWOZ5q/wIXEdPL1JPDMS63/VxoNyFM6
X-Google-Smtp-Source: AMrXdXvckoHkDOf4E756bqM8KSNSm+l5ljMVLVtJNDAs3HieoT0r/MfGdV5rm/GR/aRXXzgd26sinA==
X-Received: by 2002:a05:6a20:93a7:b0:b0:42a5:fe24 with SMTP id x39-20020a056a2093a700b000b042a5fe24mr93860274pzh.4.1673450531369;
        Wed, 11 Jan 2023 07:22:11 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id x10-20020aa79aca000000b0058a0e61136asm4231369pfp.66.2023.01.11.07.22.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:22:10 -0800 (PST)
Message-ID: <8769181a-3ee2-8082-51a9-2f2c6948bb62@ventanamicro.com>
Date: Wed, 11 Jan 2023 08:22:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 5/5] RISC-V: add zbb support to string functions
Content-Language: en-US
To: linux-riscv@lists.infradead.org
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-6-heiko@sntech.de>
 <20230111122452.ubgebzhkzova3hte@orel>
 <CAEg0e7h99EoYi1RM1GmxiRKTJkh1kgCc74ut=TN0vY+kWL9XcA@mail.gmail.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <CAEg0e7h99EoYi1RM1GmxiRKTJkh1kgCc74ut=TN0vY+kWL9XcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_072214_780066_E1443E53 
X-CRM114-Status: GOOD (  10.39  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzExLzIzIDA3OjI3LCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cgo+Pj4gKwo+Pj4g
Ky5vcHRpb24gcHVzaAo+Pj4gKy5vcHRpb24gYXJjaCwremJiCj4+PiArCj4+PiArICAgICAvKgo+
Pj4gKyAgICAgICogUmV0dXJucwo+Pj4gKyAgICAgICogICBhMCAtIGNvbXBhcmlzb24gcmVzdWx0
LCB2YWx1ZSBsaWtlIHN0cmNtcAo+Pj4gKyAgICAgICoKPj4+ICsgICAgICAqIFBhcmFtZXRlcnMK
Pj4+ICsgICAgICAqICAgYTAgLSBzdHJpbmcxCj4+PiArICAgICAgKiAgIGExIC0gc3RyaW5nMgo+
Pj4gKyAgICAgICoKPj4+ICsgICAgICAqIENsb2JiZXJzCj4+PiArICAgICAgKiAgIHQwLCB0MSwg
dDIsIHQzLCB0NCwgdDUKPj4+ICsgICAgICAqLwo+Pj4gKyAgICAgbXYgICAgICBzcmMyLCBhMQo+
Pj4gKwo+Pj4gKyAgICAgb3IgICAgICBhbGlnbiwgc3JjMSwgc3JjMgo+Pj4gKyAgICAgbGkgICAg
ICBtMSwgLTEKPj4+ICsgICAgIGFuZCAgICAgYWxpZ24sIGFsaWduLCBTWlJFRy0xCj4+PiArICAg
ICBibmV6ICAgIGFsaWduLCAzZgo+Pj4gKwo+Pj4gKyAgICAgLyogTWFpbiBsb29wIGZvciBhbGln
bmVkIHN0cmluZy4gICovCj4+PiArICAgICAucDJhbGlnbiAzCj4+Cj4+IFdoeSBhcmUgdGhlIHN0
YXJ0cyBvZiB0aGUgbG9vcHMgYWxpZ25lZCB0byA4IGJ5dGUgYm91bmRhcmllcz8KPiAKPiBMb29w
IGFsaWdubWVudCBzZWVtcyB0byBiZSBhIHZhbGlkIG9wdGltaXphdGlvbiBtZXRob2QgZm9yIG90
aGVyIGFyY2hpdGVjdHVyZXMuCj4gSSBkb24ndCBzZWUgYW55dGhpbmcgc3BlY2lmaWMgaW4gUklT
Qy1WIHRoYXQgd291bGQgbWFrZSBsb29wIGFsaWdubWVudAo+IGlycmVsZXZhbnQuClJpZ2h0LiAg
SXQncyBwcmV0dHkgY29tbW9uIHRvIHNlZSBzbWFsbCwgYnV0IG9ic2VydmFibGUgcGVyZm9ybWFu
Y2UgCmltcHJvdmVtZW50cyBvbiBtYW55IHVhcmNocyBkdWUgdG8gY29kZSBhbGlnbm1lbnRzLiAg
VGhlcmUncyB0eXBpY2FsbHkgCnRocmVlIGtub2JzIHRvIHR1bmUgaW4gdGhpcyBzcGFjZS4gIEZp
cnN0IGlzIGZ1bmN0aW9uIGFsaWdubWVudCwgc2Vjb25kIAppcyBsb29wIGFsaWdubWVudCwgdGhl
biBmaW5hbGx5IG90aGVyIGp1bXAgdGFyZ2V0IGFsaWdubWVudHMuCgpEcmV3LCBoYXBweSB0byBz
eW5jIG9uIHRoaXMgaWYgeW91IHdhbnQgLS0gSSd2ZSBnb3QgYSBsb3cgcHJpb3JpdHkgVE9ETyAK
dG8gY29tZSB1cCB3aXRoIHNvbWUgc2Vuc2libGUgZ3VpZGVsaW5lcyBmb3Igb3VyIHYxIGNoaXAu
ICAgSSdtIG5vdCB0b28gCmluY2xpbmVkIHRvIHB1c2ggaGFyZCBvbiBpdCB5ZXQgYXMgaXQnbGwg
YmUgYSBsb3QgZWFzaWVyIHRvIGZpbmQgdGhlIApzd2VldCBzcG90IG9uY2UgcmVhbCBoYXJkd2Fy
ZSBpcyBhdmFpbGFibGUuCgpqZWZmCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
