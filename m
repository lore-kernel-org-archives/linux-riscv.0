Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A27D4335B
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 01:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyNUt/8MhFj8rdahahfLMqwjgQMUYyfnpAVH9EIqs8E=; b=yuQRTdLYix2Dof/4PrNlRMkKjn
	77wt6oi70jVFAxj5rBiJPh5Oh8QlvPZUnIpI4o7IBAYH3INiqc/o7tp3yE/Zga/W9a1F8s65j4Zgd
	fC7k+HajZJhjOqkuqp3bZbMOmMmHpOoDJ/AssPCACloDTcmalNnrZoKOd3YHVwm0WfMUnyrsjq2vh
	RUYzRjZYLwPxTrXj6v0wie1GQK3Te0m9oNeT4vM47QgrtTZASpnBTSGeEjwiP/W1IfKe3haL8vFGy
	M7pf9itApx390fMb7t7qMciyy6kjoYEAGM/VYGx7UYZGMEaRPLji7HhSXHGZF4oXFlBiPp8X6Rvik
	zRBHsXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsJG-0000000HUvi-2h35;
	Fri, 12 Dec 2025 01:51:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsJE-0000000HUvJ-1B8K
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 01:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765504260; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cgurpZ8IFDjCPgCX795FqJTaiywBFBpkp+Zai4apu0KlAB0LlvU0Mu5LP7jNyJXoF1F7jASF06TzFO2n/CURxQZ1gW8dWRHHJWCsNEA/w2vfMmhUx+vaSBKy3L6hQSUARNOtve8LN5xQfXBVbZ2QSLrkhUqM9T1jQrH5na+UICM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765504260; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=uXVP0RewHFQZD4VdyMGMX24F6ZOoiqQUnyn7jYH/7UY=; 
	b=jEQYLE5bkfp4oQa0abaE+bXzKMQnKHVFq4ac6KWbqEoQUAXqw53qL/b1USdNbA0Ua87CmdAGKXdJylmVsTcPJteI64v+qCqR+MAaMVFxp5hm87op/I4BXM9czZp8XHyaXlb3mi24/H7X6Mw1xNnugHxSbbdc4FHfr3c40iH/63g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765504260;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=uXVP0RewHFQZD4VdyMGMX24F6ZOoiqQUnyn7jYH/7UY=;
	b=Z4Y3i/aD/fgFmZTWhRJ5XX5awb8iLEDznnFvoSe0Fq5ekDcd3v5kRl/a6egpNM+h
	R9M21Pn/hMQegGD7w6NOc8xtu16zGiVYtGd7Ltbm8893J4rFexCksfJ678hAIOTio1Z
	U6oQIxB6P65UMKLC09xjxYM6TN46MbZ2v4gHz+/Y=
Received: by mx.zohomail.com with SMTPS id 1765504256911404.0851080452594;
	Thu, 11 Dec 2025 17:50:56 -0800 (PST)
Message-ID: <1244329d-b842-4894-93d5-0c3c41c1eb9e@pigmoral.tech>
Date: Fri, 12 Dec 2025 09:50:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SpacemiT k1: Linux crashes setting up smp with mainline U-Boot
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <4d2e1302-723e-4f3f-ad28-586e6b4749ed@rootcommit.com>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <4d2e1302-723e-4f3f-ad28-586e6b4749ed@rootcommit.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_175104_702495_34E1B6BD 
X-CRM114-Status: UNSURE (   5.86  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGnCoE1pY2hhZWwsCgpPbiAxMi8xMi8yNSA0OjM0IEFNLCBNaWNoYWVsIE9wZGVuYWNrZXIgd3Jv
dGU6ClsuLi5dCj4gWyDCoCAwLjAwMDAwMF0gU0JJIHNwZWNpZmljYXRpb24gdjMuMCBkZXRlY3Rl
ZAo+IFvCoCDCoCAwLjAwMDAwMF0gU0JJIGltcGxlbWVudGF0aW9uIElEPTB4MSBWZXJzaW9uPTB4
MTAwMDcKPiBbwqAgwqAgMC4wMDAwMDBdIFNCSSBUSU1FIGV4dGVuc2lvbiBkZXRlY3RlZAo+IFvC
oCDCoCAwLjAwMDAwMF0gU0JJIElQSSBleHRlbnNpb24gZGV0ZWN0ZWQKPiBbwqAgwqAgMC4wMDAw
MDBdIFNCSSBSRkVOQ0UgZXh0ZW5zaW9uIGRldGVjdGVkCj4gW8KgIMKgIDAuMDAwMDAwXSBTQkkg
REJDTiBleHRlbnNpb24gZGV0ZWN0ZWQKPiBbwqAgwqAgMC4wMDAwMDBdIFNCSSBGV0ZUIGV4dGVu
c2lvbiBkZXRlY3RlZAo+ClsuLi5dCj4gc3l5cyAwLjA4Mzk1Nl0gc21wOiBCcmluZ2luZyB1cHN5
c3lzeXM6IHN5czogMHhzcwo+IDEuwqAgc3lzOnQ6OiBywqAgeTAwIHh4czAxZnhkY2ZlMTIxLjAK
PiAyMTBjLgo+Cj4gwqAgYjAKPiBtOjMKPiBqLi4uCgpUaGlzIG1pZ2h0IGFjdHVhbGx5IG5vdCBh
ICJjcmFzaCIuIEluc3RlYWQsIGl0IHNlZW1zIHRoZSBib290IGFkZHJlc3MgZm9yCkNQVXMgMS03
IGhhc24ndCBiZWVuIHNldCBjb3JyZWN0bHksIGNhdXNpbmcgdGhlbSB0byBib290IGZyb20gdGhl
IEJvb3RST00uCgpJIGJlbGlldmUgdGhpcyBpcyBub3QgYSBVLUJvb3QgaXNzdWUsIGJ1dCByYXRo
ZXIgYW4gT3BlblNCSSBvbmUuIEFjY29yZGluZwp0byB0aGUgbG9nLCBpdCBsb29rcyBsaWtlIHlv
dSBhcmUgdXNpbmcgbWFpbmxpbmUgT3BlblNCSS4gQ291bGQgeW91IHBsZWFzZQpjb25maXJtIHRo
ZSBPcGVuU0JJIHlvdSBhcmUgdXNpbmcgaW5jbHVkZXMgdGhpcyBmaXg6CgoxMjZjOWQzNCAoInBs
YXRmb3JtOiBnZW5lcmljOiBzcGFjZW1pdDogYWRkIG1pc3Npbmcgb2JqZWN0cy5tayIpCgotLSAK
QmVzdCByZWdhcmRzLApKdW5odWkgTGl1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
