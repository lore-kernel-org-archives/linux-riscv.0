Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8BCC7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTYI7khSKL5vyDtYAqn3wFsAidB5OarEaKCi4xEQnos=; b=Vt7w1Wt6a7c6B7
	esH5pnHr27gZn0K4N04Qv+V3Cyyc0b+S5QfX20LLVJc5JayKzhpusH2B0etHXckzX3GZmUVuUkZtB
	AS50umOe0fUUZRfWxN32LoZjAQ8nM5ySNRaWcX3lzphgpPg6LnLcVm1YQQ37HjiRWPalIfv7U0F6w
	f6r7ZqBxDr1OfPNrR9svXrdJuAPpxMTS7wsg9eWDvqA0JkTwuFYvcCcVhbCpZbI3Ix0nvqIjdREqs
	u1TEgpid6gV2gWTw8Le33wtTleoFDtcupflbEPU43yqjlw2UAokNulIlKmGbZBtih5PCuRxenqpIk
	c4b7dKylhvruWM/APj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TxY-001BLA-0M;
	Tue, 06 Jun 2023 10:30:40 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6TxV-001BJp-2n
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 10:30:39 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-45d3e523a43so2080565e0c.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 03:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686047433; x=1688639433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M37GgvWJac+ezE60S1jjJkXuBuA94LzOcGnWhPva6Xo=;
        b=hN/94avZS8LJoTkKCvG3N5JbQ3yi4SyKs21wwcRH8IcPKtdOvoOVCwLQQM1W5J2SGv
         Egi1kqWjplB0ykKay9rEkCoowfQaIUVp05x5BK4Lv4+1xcvcDH8KXJN4a9Sy+3dcqA6v
         gSKg+0vUM8DpPS3VyqcpBGKPxZUVoeMjMCSociGvMY2/JAJh//A1T4E5Kyo+SuXiI1mC
         tClmjle4lsjONNhFnwjmoA+r5AaQJBqVJUbV6uL/ym80BabdbrnukB1BdD08pMS0FWj5
         p68eRbLlOGZY3Mhilk8wnLedywSPpX50rGFCw1pYqtp+nRDJ6hn4y5vqHgykG9ieRmOs
         lZnA==
X-Gm-Message-State: AC+VfDyG6LSf0I+REjI+5RWtmV5YPEcNU1a0U/tuYeie/adploWf6Qs5
	1IiZohHk1q5dOlWfJcjBb4+rPso0Kx/3+Q==
X-Google-Smtp-Source: ACHHUZ7uiXsIaIabdP+Tg8+a2UAo5FyD0a7Q9Y20MsDdxG8IIscsajs7IcwE87xD4el9vU02wIzzZg==
X-Received: by 2002:a1f:3f44:0:b0:461:37d:dd3e with SMTP id m65-20020a1f3f44000000b00461037ddd3emr625354vka.15.1686047432672;
        Tue, 06 Jun 2023 03:30:32 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id h72-20020a1f214b000000b00456bc456eaasm1571464vkh.8.2023.06.06.03.30.31
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 03:30:32 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-786d1095270so2359064241.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 03:30:31 -0700 (PDT)
X-Received: by 2002:a81:8484:0:b0:568:bd5c:2f6b with SMTP id
 u126-20020a818484000000b00568bd5c2f6bmr1809215ywf.39.1686047410733; Tue, 06
 Jun 2023 03:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230111212241.7456-1-pauk.denis@gmail.com>
In-Reply-To: <20230111212241.7456-1-pauk.denis@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 12:29:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXGO17cKKvwA5sZQ+WBPzdMvghZkvv1gWvQ00X-N+EF9A@mail.gmail.com>
Message-ID: <CAMuHMdXGO17cKKvwA5sZQ+WBPzdMvghZkvv1gWvQ00X-N+EF9A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: (nct6775) Directly call ASUS ACPI WMI method
To: Denis Pauk <pauk.denis@gmail.com>
Cc: ahmad@khalifa.ws, chunkeey@gmail.com, greg@krypto.org, 
	hubert.banas@gmail.com, igor@svelig.com, jaap.dehaan@freenet.de, 
	jdelvare@suse.com, jeroen@beerstra.org, jonfarr87@gmail.com, jwp@redhat.com, 
	kdudka@redhat.com, kernel@melin.net, kpietrzak@disroot.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	me@rebtoor.com, metalcaedes@gmail.com, michael@theoddone.net, 
	mikhail.v.gavrilov@gmail.com, mundanedefoliation@gmail.com, 
	nephartyz@gmail.com, oleksandr@natalenko.name, pehlm@pekholm.org, 
	renedis@hotmail.com, robert@swiecki.net, sahan.h.fernando@gmail.com, 
	sebastian.arnhold@posteo.de, sst@poczta.fm, to.eivind@gmail.com, 
	torvic9@mailbox.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033037_910591_F8E9263B 
X-CRM114-Status: GOOD (  23.52  )
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

SGkgRGVuaXMsCgpPbiBXZWQsIEphbiAxMSwgMjAyMyBhdCAxMDoyNOKAr1BNIERlbmlzIFBhdWsg
PHBhdWsuZGVuaXNAZ21haWwuY29tPiB3cm90ZToKPiBOZXcgQVNVUyBCNjUwL0I2NjAvWDY3MCBi
b2FyZHMgZmlybXdhcmUgaGF2ZSBub3QgZXhwb3NlZCBXTUkgbW9uaXRvcmluZwo+IEdVSUQgIGFu
ZCBlbnRyeXBvaW50IG1ldGhvZCBXTUJEIGNvdWxkIGJlIGltcGxlbWVudGVkIGZvciBkaWZmZXJl
bnQgZGV2aWNlCj4gVUlELgo+Cj4gSW1wbGVtZW50IHRoZSBkaXJlY3QgY2FsbCB0byBlbnRyeXBv
aW50IG1ldGhvZCBmb3IgbW9uaXRvcmluZyB0aGUgZGV2aWNlCj4gVUlEIG9mIEI1NTAvWDU3MCBi
b2FyZHMuCj4KPiBCdWdMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIwNDgwNwo+IFNpZ25lZC1vZmYtYnk6IERlbmlzIFBhdWsgPHBhdWsuZGVuaXNAZ21h
aWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTogQWhtYWQgS2hhbGlmYSA8YWhtYWRAa2hhbGlmYS53
cz4KPiBTaWduZWQtb2ZmLWJ5OiBBaG1hZCBLaGFsaWZhIDxhaG1hZEBraGFsaWZhLndzPgoKVGhh
bmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGMzYjM3NDdkMDJmNTcxZGEg
KCJod21vbjoKKG5jdDY3NzUpIERpcmVjdGx5IGNhbGwgQVNVUyBBQ1BJIFdNSSBtZXRob2QiKSBp
biAgdjYuMy1yYzEuCgo+IC0tLSBhL2RyaXZlcnMvaHdtb24vS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvaHdtb24vS2NvbmZpZwo+IEBAIC0xNTE2LDcgKzE1MTYsNyBAQCBjb25maWcgU0VOU09SU19O
Q1Q2Nzc1X0NPUkUKPiAgY29uZmlnIFNFTlNPUlNfTkNUNjc3NQo+ICAgICAgICAgdHJpc3RhdGUg
IlBsYXRmb3JtIGRyaXZlciBmb3IgTnV2b3RvbiBOQ1Q2Nzc1RiBhbmQgY29tcGF0aWJsZXMiCj4g
ICAgICAgICBkZXBlbmRzIG9uICFQUEMKPiAtICAgICAgIGRlcGVuZHMgb24gQUNQSV9XTUkgfHwg
QUNQSV9XTUk9bgo+ICsgICAgICAgZGVwZW5kcyBvbiBBQ1BJIHx8IEFDUEk9bgo+ICAgICAgICAg
c2VsZWN0IEhXTU9OX1ZJRAo+ICAgICAgICAgc2VsZWN0IFNFTlNPUlNfTkNUNjc3NV9DT1JFCj4g
ICAgICAgICBoZWxwCgpUaGUgcmVjZW50IHBhdGNoZXMgdG8gYWRkIHN1cHBvcnQgZm9yIEFDUEkg
b24gUklTQy1WIGNhdXNlZCBtZSB0bwpzZWUgYSBxdWVzdGlvbiBhYm91dCB0aGlzIGRyaXZlciBh
Z2FpbiB3aGVuIHJ1bm5pbmcgIm1ha2Ugb2xkY29uZmlnIiwKYW5kIEkgaGFkIGEgY2xvc2VyIGxv
b2sgYXQgdGhlIGRyaXZlci4uLgpVbmxlc3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywgdGhpcyBp
cyBhIHJlYWxseSBkYW5nZXJvdXMgZHJpdmVyIHdoaWNoCmp1c3QgYmFuZ3MgYmxpbmRseSBpbnRv
IEkvTyBzcGFjZSB3aXRob3V0IGRvaW5nIGFueSBwbGF0Zm9ybSBjaGVja3MsCndoaWNoIGNvdWxk
IGNhdXNlIGEgY3Jhc2ggb3Igc3lzdGVtIGxvY2stdXA/CgpEb2VzIHRoZSBTRU5TT1JTX05DVDY3
NzUgc3ltYm9sIG5lZWQgYSBiZXR0ZXIgcGxhdGZvcm0gZGVwZW5kZW5jCnRoYW4gIVBQQz8KCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
