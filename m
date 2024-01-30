Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD887C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTJlmzG+6NHTH7iYDwYWmCWCictACCIzbpmo7/7hSxA=; b=REzTxDkfw8YIyG
	ggsYtWZs83PLsjBjlroGlM2lAc/NCogkausdDwIj9OVFvI0+2qbx83e/pzAuzebvXXe/liK3QSnuG
	Bzfm9xhbNs4XFhA9HBl/5buBzmu5WABrhdatt7oStKoRfGYjcy2rruNGVl/cXkhFvmYzjXytCBIe8
	9L74+cziNYGiWZP1fSHp2S8BRS21qVVCj03td3KuR8waMcVg/RKXO6CxB0WgPZCUazNC54nix554/
	drVhus1pdSgfzGTYL+j57QwSK/ADbE2G9f7wknWWREOCLr1+LdVaTQWZ92Q9yMusepZNpG0amgOqY
	M6J8c4D0uJzTqmu837FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm3b-0000000GMEi-2KA9;
	Tue, 30 Jan 2024 11:13:35 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUm3L-0000000GM5A-1jTz
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:13:21 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc21d7a7042so3485785276.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613197; x=1707217997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkhfesWc3cXNhR9I+0Gdhjj1m+D34LXlFioNPsh2mdQ=;
        b=iomJBouFuM8pf8q4nezQLVkZsrZybvXHjEzx8NNki4t9Dgo8bbvC1is1OfkzcV5I4b
         MOm679Etg5pxdoJJnEBozpmtoLLlBEsleWLQmcgKQ/NTuuhiZBlR5yZ2XZemWuZ7oT7n
         QmKYyAWnX9HDlb7comPS3sKEYLAvveC5hyTaspEBHEBYzN366oaYTTRkzjem2A8ZRr7E
         t7UiJsxFpQbQS5tqWMtAIqQySXC8Vez/0Pftin3afKvVb1F6lYy+BQkphqz7a3dMeZ1y
         0eun8DUvEXW1kyi0SRhTs6jQBu7P1QD/Pi8X+vPIjjw+0zshgIHUt491D01bpL4gTK6C
         5FQw==
X-Gm-Message-State: AOJu0YxlCzeGhqCQ1FcIRaqslDjXoBjEpK1ZoJTu/A+qAwG9gyL7HkwS
	CQP3k4gA9qn1rthPGCYEs71uV7zQmQoeqiX2e1PIU86dF4uaJMENxHgoWvhXP9s=
X-Google-Smtp-Source: AGHT+IF50nJ7Mn6smKhLE1fSVKmQZZiTensMruGai3K8hb49T8E8qjdy3ZWhzJ49Zfhr7BMd5ysblw==
X-Received: by 2002:a25:aa82:0:b0:dc2:1de1:8f67 with SMTP id t2-20020a25aa82000000b00dc21de18f67mr3737016ybi.53.1706613197072;
        Tue, 30 Jan 2024 03:13:17 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id c2-20020a258802000000b00dc2366900f9sm2796191ybl.65.2024.01.30.03.13.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:13:16 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-602cab8d7c9so41227277b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 03:13:16 -0800 (PST)
X-Received: by 2002:a0d:ff04:0:b0:5ff:a8da:5a5a with SMTP id
 p4-20020a0dff04000000b005ffa8da5a5amr5698698ywf.5.1706613196494; Tue, 30 Jan
 2024 03:13:16 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240129-magical-unclaimed-e725e2491ccb@spud>
In-Reply-To: <20240129-magical-unclaimed-e725e2491ccb@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jan 2024 12:13:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
Message-ID: <CAMuHMdVhXh_Cd8m00xfVRB9JA8Mfb9+qccu94iVpUMS2z5kmUQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/Five SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_031319_568733_B1788752 
X-CRM114-Status: GOOD (  25.91  )
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

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNjozMOKAr1BNIENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQg
MDM6MTY6MTRQTSArMDAwMCwgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWth
ciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IERvY3Vt
ZW50IFJaL0ZpdmUgKFI5QTA3RzA0M0YpIElSUUMgYmluZGluZ3MuIFRoZSBJUlFDIGJsb2NrIG9u
IFJaL0ZpdmUgU29DCj4gPiBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIG9uZSBmb3VuZCBvbiB0aGUg
UlovRzJMIFNvQyB3aXRoIGJlbG93IGRpZmZlcmVuY2VzLAo+ID4gKiBBZGRpdGlvbmFsIEJVUyBl
cnJvciBpbnRlcnJ1cHQKPiA+ICogQWRkaXRpb25hbCBFQ0NSQU0gZXJyb3IgaW50ZXJydXB0Cj4g
PiAqIEhhcyBhZGRpdGlvbmFsIG1hc2sgY29udHJvbCByZWdpc3RlcnMgZm9yIE5NSS9JUlEvVElO
VAo+ID4KPiA+IEhlbmNlIG5ldyBjb21wYXRpYmxlIHN0cmluZyAicmVuZXNhcyxyOWEwN2cwNDNm
LWlycWMiIGlzIGFkZGVkIGZvciBSWi9GaXZlCj4gPiBTb0MuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
PgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZW5lc2FzLHJ6ZzJsLWlycWMueWFt
bAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL3JlbmVzYXMscnpnMmwtaXJxYy55YW1sCj4gPiBAQCAtMjMsNiArMjMsNyBAQCBw
cm9wZXJ0aWVzOgo+ID4gICAgY29tcGF0aWJsZToKPiA+ICAgICAgaXRlbXM6Cj4gPiAgICAgICAg
LSBlbnVtOgo+ID4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQzZi1pcnFjICAgIyBSWi9G
aXZlCj4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDN1LWlycWMgICAjIFJaL0cyVUwK
PiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0NC1pcnFjICAgICMgUlovRzJ7TCxMQ30K
PiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA1NC1pcnFjICAgICMgUlovVjJMCj4gPiBA
QCAtODgsNiArODksMTIgQEAgcHJvcGVydGllczoKPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBH
UElPIGludGVycnVwdCwgVElOVDMwCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogR1BJTyBpbnRl
cnJ1cHQsIFRJTlQzMQo+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IEJ1cyBlcnJvciBpbnRlcnJ1
cHQKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0wIFRJRTEgaW50ZXJydXB0CgpFQ0NS
QU0wIDFiaXQgZXJyb3IgaW50ZXJydXB0PwoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NS
QU0wIFRJRTIgaW50ZXJydXB0CgpFQ0NSQU0wIDJiaXQgZXJyb3IgaW50ZXJydXB0PwoKPiA+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0wIG92ZXJmbG93IGludGVycnVwdAoKRUNDUkFNMCBl
cnJvciBvdmVyZmxvdyBpbnRlcnJ1cHQ/Cgo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JB
TTEgVElFMSBpbnRlcnJ1cHQKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0xIFRJRTIg
aW50ZXJydXB0Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogRUNDUkFNMSBvdmVyZmxvdyBpbnRl
cnJ1cHQKCkxpa2V3aXNlLgoKPiA+ICAgIGludGVycnVwdC1uYW1lczoKPiA+ICAgICAgbWluSXRl
bXM6IDQxCj4gPiBAQCAtMTM0LDYgKzE0MSwxMiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIC0g
Y29uc3Q6IHRpbnQzMAo+ID4gICAgICAgIC0gY29uc3Q6IHRpbnQzMQo+ID4gICAgICAgIC0gY29u
c3Q6IGJ1cy1lcnIKPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLXRpZTEKPiA+ICsgICAgICAt
IGNvbnN0OiBlY2NyYW0wLXRpZTIKPiA+ICsgICAgICAtIGNvbnN0OiBlY2NyYW0wLW92Zgo+ID4g
KyAgICAgIC0gY29uc3Q6IGVjY3JhbTEtdGllMQo+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEt
dGllMgo+ID4gKyAgICAgIC0gY29uc3Q6IGVjY3JhbTEtb3ZmCgpXaHkgbm90IHVzZSB0aGUgbmFt
aW5nIGZyb20gdGhlIGRvY3MgKGFsbCA2IGluY2x1ZGUgInRpIik/CkVDN1RJRTFfMCwgRUM3VElF
Ml8wLCBFQzdUSU9WRl8wLCBFQzdUSUUxXzEsIEVDN1RJRTJfMSwgRUM3VElPVkZfMQo9PiBlYzd0
aWUxLTAsIGVjN3RpZTItMCwgZWM3dGlvdmYtMCwgLi4uPwoKPiBJIHRoaW5rIHRoZSByZXN0cmlj
dGlvbnMgYWxyZWFkeSBpbiB0aGUgZmlsZSBiZWNvbWUgaW5jb3JyZWN0IHdpdGggdGhpcwo+IHBh
dGNoOgo+ICAgLSBpZjoKPiAgICAgICBwcm9wZXJ0aWVzOgo+ICAgICAgICAgY29tcGF0aWJsZToK
PiAgICAgICAgICAgY29udGFpbnM6Cj4gICAgICAgICAgICAgZW51bToKPiAgICAgICAgICAgICAg
IC0gcmVuZXNhcyxyOWEwN2cwNDN1LWlycWMKPiAgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOWEw
OGcwNDUtaXJxYwo+ICAgICB0aGVuOgo+ICAgICAgIHByb3BlcnRpZXM6Cj4gICAgICAgICBpbnRl
cnJ1cHRzOgo+ICAgICAgICAgICBtaW5JdGVtczogNDIKPiAgICAgICAgIGludGVycnVwdC1uYW1l
czoKPiAgICAgICAgICAgbWluSXRlbXM6IDQyCj4gICAgICAgcmVxdWlyZWQ6Cj4gICAgICAgICAt
IGludGVycnVwdC1uYW1lcwo+Cj4gVGhpcyB1c2VkIHRvIHJlcXVpcmUgYWxsIDQyIGludGVycnVw
dHMgZm9yIHRoZSB0d28gY29tcGF0aWJsZXMgaGVyZQo+IGFuZCBhdCBsZWFzdCB0aGUgZmlyc3Qg
NDEgb3RoZXJ3aXNlLiBOb3cgeW91J3ZlIGluY3JlYXNlZCB0aGUgbnVtYmVyIG9mCj4gaW50ZXJy
dXB0cyB0byA0OCB0aGVyZWJ5IHJlbW92aW5nIHRoZSB1cHBlciBsaW1pdHMgb24gdGhlIGV4aXN0
aW5nCj4gZGV2aWNlcy4KCkknbSBnb25uYSByZXBlYXQgKGFuZCBleHRlbmQpIG15IHF1ZXN0aW9u
IGZyb20gWzFdOiBIb3cgY29tZSB3ZSB0aG91Z2h0ClJaL0cyTCBhbmQgUlovVjJMIGRvIG5vdCBo
YXZlIHRoZSBidXMgZXJyb3IgYW5kIEVDQ1JBTSBpbnRlcnJ1cHRzPwpMb29rcyBsaWtlIG1vc3Qg
b2YgdGhlIGNvbmRpdGlvbmFsIGhhbmRsaW5nIGNhbiBiZSByZW1vdmVkIChzZWUgYmVsb3cpLgoK
PiBHaXZlbiB0aGUgY29tbWl0IG1lc3NhZ2UsIEkgZmlndXJlIHRoYXQgcHJvdmlkaW5nIDQ4IGlu
dGVycnVwdHMgZm9yCj4gKGF0IGxlYXN0IHNvbWUgb2YpIHRob3NlIGRldmljZXMgd291bGQgYmUg
aW5jb3JyZWN0PwoKTG9va3MgbGlrZSBhbGwgb2YgUlovRzJMeyxDfSwgUlovVjJMLCBSWi9HMlVM
LCBhbmQgUlovRml2ZSBzdXBwb3J0CmFsbCA0OCBpbnRlcnJ1cHRzLiAgUlovRzNTIGxhY2tzIHRo
ZSBmaW5hbCB0aHJlZSBmb3IgRUNDUkFNMS4KClsxXSAiUmU6IFtQQVRDSCB2MyA4LzldIGR0LWJp
bmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjoKcmVuZXNhcyxyemcybC1pcnFjOiBEb2N1bWVu
dCBSWi9HM1MiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FNdUhNZFg4OEtSbnZKY2hVd3JX
Y2dtUG9vQUVTT1QyNDkyTnIxWl81VU1uZzNxX19RQG1haWwuZ21haWwuY29tCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
