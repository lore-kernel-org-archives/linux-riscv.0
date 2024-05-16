Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B1C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 00:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFAK/lZyK0Kw1l9GY33VJjFOmLVio8BTxGmlJMLZSU8=; b=bM7NZZz4HvzAZR
	8+0HU9aoPorO2yP7mCA4sR4K0PA4JdjHPHzaPZJMoxkPaorrkam+Ts9PZ7Osaasj7seLgE/C2OMl6
	+tbgTpBDahP2MU4029UglRgsfI/yVRyR6CTuEE+hvF2lv5OEQDtw0+ver3QBAf3WEoQtbcESgcua+
	zlA+JnMxmCTwYk8WMDNw8ajfif2GeBaurVTfI92BoIcMZCDmWfbHNI1iPSAwyWVbotcySxDvMk17K
	LO727bE0rDNNGpp6tvUX6unncy5S3sY2dUn/R7KzbLNgm6aTQtbMjKz4bIfXX+N4VfWhEQZKQHa2e
	rQVpi8/6aNkWD20sW5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7PSL-00000003JuW-1eo1;
	Thu, 16 May 2024 00:58:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7PSH-00000003Jtz-1vBa
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 00:58:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41ff5e3dc3bso43464225e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 17:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1715821121; x=1716425921; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW/q7stGvy6OMoCA218cQyZGjRLhnAtQ3Ys6NaaQOAE=;
        b=BRsxH/+0g6mKiMPplreD6ocWsQ62Z/498cWzgbi1S8Q/nFTmAcBApJdxgqAsMnTXHa
         Wq35bILU6lKZiElOAI95NZejwhhXfmm3MqhRQyGhgpkbTmnbWfQiQz/KefZsQLSd3YZh
         q30mqbyuJdsUsrxsu1jv06UDbru7IJCYuyGRI0/q3EKilNjPumTmUWmIR6vwflNIGRZ7
         +Io6fuw+5uTlwFJpsY5b1HbIuftlEoibCMU/r8ZBx0EszZLkRreuRXgbqTxQSNc+M/yk
         nZ0Sm7pcigJ8FzuZZgRUC7rLXjxHKR61S7OBNNZk6HwjEINMUjkzm41EDKYoKfk3VMyH
         qlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715821121; x=1716425921;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SW/q7stGvy6OMoCA218cQyZGjRLhnAtQ3Ys6NaaQOAE=;
        b=W0lA8NeuZiXZZnNB2OK8YQTEkeMn4RB28unTYVmo+rroZilEBmhih3g1HxVrTea/VA
         QNwVzmG5TKN37bf+gQJzn+C2NPgal8Mof78no9PhSQVQ5zkPubl9xZ0BuvuLHnX0dWC/
         PRYxKpUiT+wpD5Vs86fK1vxOuo1WPYSHkuDSss8wK6fUojrv8o7TZ2eVhzvEy0g7zqNf
         sR8XGvk2PBncshh7VXTwG2JfcgQ6SSzuudLS3cs/sO9cISMCMCOVDzCVOrnaCUBKMRxK
         B28Wlbetn4YPTzwnxslVIPmJmv2ijOppjxM3TWac4RfisLJwjniRzZcJGx49VU4UE3KY
         6U2w==
X-Forwarded-Encrypted: i=1; AJvYcCWoEircj7WjSM4chNkqm1196wnwzShEbZsh75wfTsxPfHLl8qxcbNUQcEiYD2452cKaLJxA+dBw2TSDSWOhtD0jNoQlXadJc/3slyWJguE+
X-Gm-Message-State: AOJu0Yyy7XEGRk4p6kChIUa8vAPGOuZ3E+McjA2daoqN4Ps6yCT0GJSl
	3wO0QfuDoAA/MHdSXz7tjVZ0KzY2WmlCRPEzjG5pqYTcJojtVdNmzv4Nc3kgnxw=
X-Google-Smtp-Source: AGHT+IG8/7wKols6oq37R5OJvGqZTKvcrgWEhHIDZA0YIaNJ+IfZHMO7lXNZePnotDSmTCdPiS6z1w==
X-Received: by 2002:a05:600c:35d6:b0:41a:a4b1:c098 with SMTP id 5b1f17b1804b1-4200fcb9e94mr90424695e9.19.1715821120656;
        Wed, 15 May 2024 17:58:40 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccbe8fc6sm248541215e9.4.2024.05.15.17.58.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2024 17:58:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 0/2] riscv: Allow vlenb to be probed from DT
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <ZkVAYeNnvj99YHXt@ghost>
Date: Thu, 16 May 2024 01:58:29 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Message-Id: <6DDF33DF-07D6-4230-8674-F91A91660686@jrtc27.com>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
 <A9EDD470-B8EC-4644-82A0-7444729EF885@jrtc27.com> <ZkVAYeNnvj99YHXt@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_175845_663340_1790C427 
X-CRM114-Status: GOOD (  26.86  )
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

T24gMTYgTWF5IDIwMjQsIGF0IDAwOjA4LCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPiB3cm90ZToKPiAKPiBPbiBXZWQsIE1heSAxNSwgMjAyNCBhdCAxMToyNToxNlBNICsw
MTAwLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPj4gT24gMTUgTWF5IDIwMjQsIGF0IDIyOjUwLCBD
aGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+IAo+Pj4gVGhl
IGtlcm5lbCBjdXJyZW50bHkgcmVxdWlyZXMgYWxsIGhhcnRzIHRvIGhhdmUgdGhlIHNhbWUgdmFs
dWUgaW4gdGhlCj4+PiB2bGVuYiBjc3IgdGhhdCBpcyBwcmVzZW50IHdoZW4gYSBoYXJ0IHN1cHBv
cnRzIHZlY3Rvci4gSW4gb3JkZXIgdG8gcmVhZAo+Pj4gdGhpcyBjc3IsIHRoZSBrZXJuZWwgbmVl
ZHMgdG8gYm9vdCB0aGUgaGFydC4gQWRkaW5nIHZsZW5iIHRvIHRoZSBEVCB3aWxsCj4+PiBhbGxv
dyB0aGUga2VybmVsIHRvIGRldGVjdCB0aGUgaW5jb25zaXN0ZW5jeSBlYXJseSBhbmQgbm90IHdh
c3RlIHRpbWUKPj4+IHRyeWluZyB0byBib290IGhhcnRzIHRoYXQgaXQgZG9lc24ndCBzdXBwb3J0
Lgo+PiAKPj4gVGhhdCBkb2VzbuKAmXQgc2VlbSBzdWZmaWNpZW50IGp1c3RpZmljYXRpb24gdG8g
bWUuIElmIGl0IGNhbiBiZSByZWFkCj4+IGZyb20gdGhlIGhhcmR3YXJlLCB3aHkgc2hvdWxkIHdl
IGhhdmUgdG8gcHV0IGl0IGluIHRoZSBGRFQ/IFRoZSB3aG9sZQo+PiBwb2ludCBvZiB0aGUgRkRU
IGlzIHRvIGNvbW11bmljYXRlIHRoZSBoYXJkd2FyZSBjb25maWd1cmF0aW9uIHRoYXQKPj4gaXNu
4oCZdCBvdGhlcndpc2UgZGlzY292ZXJhYmxlLgo+IAo+IFllcyB5b3UgYXJlIGNvcnJlY3QgaW4g
dGhhdCB2bGVuYiBpcyBkaXNjb3ZlcmFibGUgb24gYW55IGNvbmZvcm1pbmcKPiBjaGlwLiBIb3dl
dmVyLCB0aGUgbW90aXZhdGlvbiBoZXJlIGlzIGZvciBtYWtpbmcgZGVjaXNpb25zIGFib3V0IGhv
dyB0bwo+IGJvb3QgYSBoYXJ0IGJlZm9yZSBpdCBpcyBib290ZWQuIEJ5IHBsYWNpbmcgaXQgaW4g
dGhlIGRldmljZSB0cmVlLCB3ZQo+IGFyZSBhYmxlIHRvIGRpc2FibGUgdmVjdG9yIGJlZm9yZSB0
aGUgY2hpcCBpcyBib290ZWQgaW5zdGVhZCBvZiB0cnlpbmcKPiB0byBib290IHRoZSBjaGlwIHdp
dGggdmVjdG9yIGVuYWJsZWQgb25seSB0byBkaXNhYmxlIGl0IGxhdGVyLiBJbiBib3RoCj4gY2Fz
ZXMgd2hlbiB0aGVyZSBpcyBkaWZmZXJlbnQgdmxlbmIgb24gZGlmZmVyZW50IGhhcnRzLCBhbGwg
aGFydHMgc3RpbGwKPiBib290IGFuZCB0aGUgb3V0Y29tZSBpcyB0aGF0IHZlY3RvciBpcyBkaXNh
YmxlZC4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdAo+IHdpdGggdGhlIERUIGVudHJ5LCBubyB2ZWN0
b3Igc2V0dXAgY29kZSBuZWVkcyB0byBiZSByYW4gb24gYSBib290aW5nCj4gaGFydCB3aGVuIHRo
ZSBvdXRjb21lIHdpbGwgYmUgdGhhdCB2ZWN0b3IgaXMgbm90IGVuYWJsZWQuCgpXaHkgZG9lcyB2
bGVuIGdldCB0aGlzIHNwZWNpYWwgdHJlYXRtZW50PyBZb3UgY291bGQgbWFrZSBleGFjdGx5IHRo
ZQpzYW1lIGFyZ3VtZW50IGZvciB0aGUgbnVtYmVyIG9mIGFzaWQgYml0cy4gVGhlIHByZWNlZGVu
dCBpbiB0aGUga2VybmVsLAp3aGV0aGVyIFJJU0MtViBvciBvdGhlciBhcmNoaXRlY3R1cmVzLCBp
cyB0byBub3QgZG8gdGhpcy4gWW91IGNhbgpkZXRlY3QgaXQsIHNvIHlvdSBzaG91bGQsIGVzcGVj
aWFsbHkgc2luY2Ugb3B0aW1pc2luZyBmb3IgYW4KZXhjZXB0aW9uYWwsIHVuZXhwZWN0ZWQgZXJy
b3IgY2FzZSBpcyBub3Qgd29ydGh3aGlsZS4KCj4+IEFzIGZvciBULUhFQUQgc3R1ZmYsIGlmIHRo
ZXkgbmVlZCBpdCB0aGV5IGNhbiBoYXZlIGEgY3VzdG9tIHByb3BlcnR5Lgo+PiBUaG91Z2ggbmFp
dmVseSBJ4oCZZCBhc3N1bWUgdGhlcmXigJlzIGEgd2F5IHRvIGF2b2lkIGl0IHN0aWxsLi4uCj4g
Cj4gVC1IZWFkIGRvZXMgbm90IGV4cG9zZSB2bGVuYiBvbiBhbGwgb2YgdGhlaXIgY2hpcHMgc28g
SSBkbyBub3Qga25vdyBvZgo+IGFueSBvdGhlciB3YXkgb2YgZ2V0dGluZyB0aGUgdmxlbmIgd2l0
aG91dCBoYXZpbmcgaXQgYmUgcHJvdmlkZWQgaW4gYQo+IERULiBUaGF0IHdhcyB0aGUgbW90aXZh
dGlvbiBmb3IgdGhpcyBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UsIGJ1dAo+IG1ha2luZyB0aGlz
IGF2YWlsYWJsZSB0byBhbGwgdmVuZG9ycyBhbGxvd3Mgb3B0aW1pemF0aW9ucyB0byBoYXBwZW4K
PiBkdXJpbmcgYm9vdC4KCkhvdyBkb2VzIHVzZXJzcGFjZSByZWFkIGl0IHRoZW4/IEJ1dCBpZiBU
LUhFQUQgbmVlZCBpdCwgdGhhdCBtZWFucyBpdApzaG91bGQgYmUgYSB0aGVhZCx2bGVuLCBub3Qg
YSByaXNjdix2bGVuLgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
