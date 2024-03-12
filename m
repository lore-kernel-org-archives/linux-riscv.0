Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92772C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTUkH1H9WvIzviEuZNe9GCZpuo5d7asz27sMbn0i9AQ=; b=eCB00vFb/s925E
	VwcT7xHRCUssNPeeOyuWV00ZgiASvJ0Sz65zCwrzrk6rBa+HHSagGvj8UsZnMOS2/Ewee7IQ1nYAP
	vW1/6e8PLD5yGWs8M8tOoYS/dGYotXeHQiNAQaVlQZKrY9bxcXEVyMpKacZQkMwXIuhHKXqT2JnYa
	XU/ocnQE2Sgr4/cQ0BUVox3xADUJsGdN6y0gnSRWIn0Aw7VEdwhF0MVYccWZHz7gR9ytTbZzkYHxT
	nvT4KLRy3w/ic2BXYPeasMhtNPNnWh93fif70MJ79tsUGKATka26tR1B0bNTV7jK47pWoTb5qL540
	x6JrG8lC4qbDh3nxaI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5DD-00000006djs-29EB;
	Tue, 12 Mar 2024 16:42:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5D9-00000006dgu-2oj2;
	Tue, 12 Mar 2024 16:42:45 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33e672e10cfso2906434f8f.0;
        Tue, 12 Mar 2024 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710261751; x=1710866551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLfmcQWu5XXgWrSqV2rZUXevRLdZ2i834nrQ0vcBR5U=;
        b=XMzfTfTjd0y8zbQ30cHTauyB92tC9uOU0oIwN+PlA7pre3URMgJiBuEzIHO0B3hHgE
         Jm2xuxETWvcXzHYG3Bx8fc2zTuqVYK/GH+eC+020LM8p4Jl8ck0kdk8aFZ+8jRtawr/a
         8P+UJqB2QYRsMxo8m7dL6rGxC2585J2Zf9wmHunSs5y+0rZd2MinnEkRhkEYtTuuWIIL
         QNk85ygrx1pykAp73bFImWefJ4jl7M3mpgoJfRT96sFJpoj7BIFSjIIxbYODx91UZSyF
         mGQwQjPYWyWF4tLqVbFUETDYGAVW+pda9E8dkVukNQTJ1WB/HciUbkSouU7Eq6TziK9M
         Mkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710261751; x=1710866551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLfmcQWu5XXgWrSqV2rZUXevRLdZ2i834nrQ0vcBR5U=;
        b=BVKGU5zCX/I6kOIoV113b42FV8M1r5csevd2RXYCv29fRo8N/JLz/v+0QZaQzW/wZB
         tlWCUYhIB1Lb4o6zhVQKbg/fvSaq3JIFJ9nYH1xzLTiUYjF0DCG84VwGz9DmgmE2y6RQ
         8YthEz4fnk9neMI5SoWJUfzl/siqgARc4+9r/itUZtYUrtz0YD2wIwiFJ+iQVj8cdVwK
         483p+p70jj8ki8K69byFj9TUCYJ5XbNSTKOS+nyO6tIr+uthHtpwhxTszt/jfAnmqtKf
         de8YZNcRPl2WXYfS/JHj+93VR/tIv5igfL8hS22DNGOKgi4ta9kYxiY27YHoij7cUJVS
         jyhA==
X-Forwarded-Encrypted: i=1; AJvYcCVAOzDnaJrKUIf/HAH4hyQ9YtNePNcpfUbsgl6sfRZvSWyfLOIGxCFMMzbbohMemdvJe/z21d2PkzVmItBg2dqxQqnSy7ipH9BXDovJgQ658tb13qlvm4juKWTL+rUU5eNLMEA/cUT2jHVGxGM3cI5ae/10lQo=
X-Gm-Message-State: AOJu0YzxilqBGtqrRzVXoXUu3PJfpUhLPZbukZCD9Of3jE0HjaImQ2Z3
	m92j3j0+kESPfYQI87oumvRTf7sh0MIpmaG/8vNxDZUaJKrKAigRWV/iAuF3cjdYywDBlNHVFmE
	eiNKw0PuY1IudzLUDGAa7P3X7FN8=
X-Google-Smtp-Source: AGHT+IEa+4UMJem4Fp/QIrh+BONIvwnIkZaOvOjaYS7rj5IxmTt11nQG4gevX9xIkt30Kg19GjMMdC27opnimO5UKuk=
X-Received: by 2002:adf:fa91:0:b0:33e:11c3:7ebf with SMTP id
 h17-20020adffa91000000b0033e11c37ebfmr6854846wrr.62.1710261750841; Tue, 12
 Mar 2024 09:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com> <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
In-Reply-To: <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 Mar 2024 09:42:17 -0700
Message-ID: <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_094243_752582_A5DA18DF 
X-CRM114-Status: GOOD (  38.03  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzo0MuKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAxMDow
OeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo+IDxhbGV4ZWkuc3Rhcm92b2l0b3ZAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIE1hciAxMSwgMjAyNCBhdCA3OjAx4oCvUE0g5qKm6b6Z
6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
VHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo0NuKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo+ID4gPiA8
YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBN
b24sIE1hciAxMSwgMjAyNCBhdCAyOjM04oCvQU0gTWVuZ2xvbmcgRG9uZwo+ID4gPiA+IDxkb25n
bWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJbiB0
aGlzIGNvbW1pdCwgd2UgYWRkIHRoZSAnYWNjZXNzZWRfYXJncycgZmllbGQgdG8gc3RydWN0IGJw
Zl9wcm9nX2F1eCwKPiA+ID4gPiA+IHdoaWNoIGlzIHVzZWQgdG8gcmVjb3JkIHRoZSBhY2Nlc3Nl
ZCBpbmRleCBvZiB0aGUgZnVuY3Rpb24gYXJncyBpbgo+ID4gPiA+ID4gYnRmX2N0eF9hY2Nlc3Mo
KS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBNZWFud2hpbGUsIHdlIGFkZCB0aGUgZnVuY3Rpb24gYnRm
X2NoZWNrX2Z1bmNfcGFydF9tYXRjaCgpIHRvIGNvbXBhcmUgdGhlCj4gPiA+ID4gPiBhY2Nlc3Nl
ZCBmdW5jdGlvbiBhcmdzIG9mIHR3byBmdW5jdGlvbiBwcm90b3R5cGUuIFRoaXMgZnVuY3Rpb24g
d2lsbCBiZQo+ID4gPiA+ID4gdXNlZCBpbiB0aGUgZm9sbG93aW5nIGNvbW1pdC4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBi
eXRlZGFuY2UuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC9icGYu
aCB8ICAgNCArKwo+ID4gPiA+ID4gIGtlcm5lbC9icGYvYnRmLmMgICAgfCAxMDggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ID4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDExMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4KPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYu
aAo+ID4gPiA+ID4gaW5kZXggOTVlMDc2NzNjZGMxLi4wZjY3N2ZkY2ZjYzcgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gPiA+ID4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L2JwZi5oCj4gPiA+ID4gPiBAQCAtMTQ2MSw2ICsxNDYxLDcgQEAgc3RydWN0IGJwZl9wcm9n
X2F1eCB7Cj4gPiA+ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqYXR0YWNoX2Z1
bmNfcHJvdG87Cj4gPiA+ID4gPiAgICAgICAgIC8qIGZ1bmN0aW9uIG5hbWUgZm9yIHZhbGlkIGF0
dGFjaF9idGZfaWQgKi8KPiA+ID4gPiA+ICAgICAgICAgY29uc3QgY2hhciAqYXR0YWNoX2Z1bmNf
bmFtZTsKPiA+ID4gPiA+ICsgICAgICAgdTY0IGFjY2Vzc2VkX2FyZ3M7Cj4gPiA+ID4gPiAgICAg
ICAgIHN0cnVjdCBicGZfcHJvZyAqKmZ1bmM7Cj4gPiA+ID4gPiAgICAgICAgIHZvaWQgKmppdF9k
YXRhOyAvKiBKSVQgc3BlY2lmaWMgZGF0YS4gYXJjaCBkZXBlbmRlbnQgKi8KPiA+ID4gPiA+ICAg
ICAgICAgc3RydWN0IGJwZl9qaXRfcG9rZV9kZXNjcmlwdG9yICpwb2tlX3RhYjsKPiA+ID4gPiA+
IEBAIC0yNTY1LDYgKzI1NjYsOSBAQCBzdHJ1Y3QgYnBmX3JlZ19zdGF0ZTsKPiA+ID4gPiA+ICBp
bnQgYnRmX3ByZXBhcmVfZnVuY19hcmdzKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGlu
dCBzdWJwcm9nKTsKPiA+ID4gPiA+ICBpbnQgYnRmX2NoZWNrX3R5cGVfbWF0Y2goc3RydWN0IGJw
Zl92ZXJpZmllcl9sb2cgKmxvZywgY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nLAo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0
IGJ0Zl90eXBlICp0KTsKPiA+ID4gPiA+ICtpbnQgYnRmX2NoZWNrX2Z1bmNfcGFydF9tYXRjaChz
dHJ1Y3QgYnRmICpidGYxLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQxLAo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0ZiAqYnRmMiwgY29uc3Qgc3RydWN0
IGJ0Zl90eXBlICp0MiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2
NCBmdW5jX2FyZ3MpOwo+ID4gPiA+ID4gIGNvbnN0IGNoYXIgKmJ0Zl9maW5kX2RlY2xfdGFnX3Zh
bHVlKGNvbnN0IHN0cnVjdCBidGYgKmJ0ZiwgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICpwdCwKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBjb21wX2lkeCwg
Y29uc3QgY2hhciAqdGFnX2tleSk7Cj4gPiA+ID4gPiAgaW50IGJ0Zl9maW5kX25leHRfZGVjbF90
YWcoY29uc3Qgc3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnB0LAo+ID4g
PiA+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvYnRmLmMgYi9rZXJuZWwvYnBmL2J0Zi5jCj4g
PiA+ID4gPiBpbmRleCAxNzBkMDE3ZThlNGEuLmMyYTAyOTlkNDM1OCAxMDA2NDQKPiA+ID4gPiA+
IC0tLSBhL2tlcm5lbC9icGYvYnRmLmMKPiA+ID4gPiA+ICsrKyBiL2tlcm5lbC9icGYvYnRmLmMK
PiA+ID4gPiA+IEBAIC02MTI1LDE5ICs2MTI1LDI0IEBAIHN0YXRpYyBib29sIGlzX2ludF9wdHIo
c3RydWN0IGJ0ZiAqYnRmLCBjb25zdCBzdHJ1Y3QgYnRmX3R5cGUgKnQpCj4gPiA+ID4gPiAgfQo+
ID4gPiA+ID4KPiA+ID4gPiA+ICBzdGF0aWMgdTMyIGdldF9jdHhfYXJnX2lkeChzdHJ1Y3QgYnRm
ICpidGYsIGNvbnN0IHN0cnVjdCBidGZfdHlwZSAqZnVuY19wcm90bywKPiA+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCBvZmYpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnQgb2ZmLCBpbnQgKmFsaWduZWRfaWR4KQo+ID4gPiA+ID4gIHsKPiA+ID4g
PiA+ICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqYXJnczsKPiA+ID4gPiA+ICAgICAg
ICAgY29uc3Qgc3RydWN0IGJ0Zl90eXBlICp0Owo+ID4gPiA+ID4gICAgICAgICB1MzIgb2Zmc2V0
ID0gMCwgbnJfYXJnczsKPiA+ID4gPiA+ICAgICAgICAgaW50IGk7Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gKyAgICAgICBpZiAoYWxpZ25lZF9pZHgpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgKmFs
aWduZWRfaWR4ID0gLUVOT0VOVDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgICAgaWYgKCFm
dW5jX3Byb3RvKQo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiBvZmYgLyA4Owo+ID4g
PiA+ID4KPiA+ID4gPiA+ICAgICAgICAgbnJfYXJncyA9IGJ0Zl90eXBlX3ZsZW4oZnVuY19wcm90
byk7Cj4gPiA+ID4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0IGJ0Zl9wYXJhbSAqKShm
dW5jX3Byb3RvICsgMSk7Cj4gPiA+ID4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9hcmdz
OyBpKyspIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoYWxpZ25lZF9pZHggJiYgb2Zm
c2V0ID09IG9mZikKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICphbGlnbmVkX2lk
eCA9IGk7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgdCA9IGJ0Zl90eXBlX3NraXBfbW9kaWZp
ZXJzKGJ0ZiwgYXJnc1tpXS50eXBlLCBOVUxMKTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBv
ZmZzZXQgKz0gYnRmX3R5cGVfaXNfcHRyKHQpID8gOCA6IHJvdW5kdXAodC0+c2l6ZSwgOCk7Cj4g
PiA+ID4gPiAgICAgICAgICAgICAgICAgaWYgKG9mZiA8IG9mZnNldCkKPiA+ID4gPiA+IEBAIC02
MjA3LDcgKzYyMTIsNyBAQCBib29sIGJ0Zl9jdHhfYWNjZXNzKGludCBvZmYsIGludCBzaXplLCBl
bnVtIGJwZl9hY2Nlc3NfdHlwZSB0eXBlLAo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgdG5hbWUsIG9mZik7Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ID4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4gPiAtICAgICAgIGFyZyA9IGdldF9jdHhfYXJnX2lk
eChidGYsIHQsIG9mZik7Cj4gPiA+ID4gPiArICAgICAgIGFyZyA9IGdldF9jdHhfYXJnX2lkeChi
dGYsIHQsIG9mZiwgTlVMTCk7Cj4gPiA+ID4gPiAgICAgICAgIGFyZ3MgPSAoY29uc3Qgc3RydWN0
IGJ0Zl9wYXJhbSAqKSh0ICsgMSk7Cj4gPiA+ID4gPiAgICAgICAgIC8qIGlmICh0ID09IE5VTEwp
IEZhbGwgYmFjayB0byBkZWZhdWx0IEJQRiBwcm9nIHdpdGgKPiA+ID4gPiA+ICAgICAgICAgICog
TUFYX0JQRl9GVU5DX1JFR19BUkdTIHU2NCBhcmd1bWVudHMuCj4gPiA+ID4gPiBAQCAtNjIxNyw2
ICs2MjIyLDkgQEAgYm9vbCBidGZfY3R4X2FjY2VzcyhpbnQgb2ZmLCBpbnQgc2l6ZSwgZW51bSBi
cGZfYWNjZXNzX3R5cGUgdHlwZSwKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAvKiBza2lwIGZp
cnN0ICd2b2lkICpfX2RhdGEnIGFyZ3VtZW50IGluIGJ0Zl90cmFjZV8jI25hbWUgdHlwZWRlZiAq
Lwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGFyZ3MrKzsKPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICBucl9hcmdzLS07Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcHJvZy0+YXV4LT5hY2Nl
c3NlZF9hcmdzIHw9ICgxIDw8IChhcmcgKyAxKSk7Cj4gPiA+ID4gPiArICAgICAgIH0gZWxzZSB7
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcHJvZy0+YXV4LT5hY2Nlc3NlZF9hcmdzIHw9ICgx
IDw8IGFyZyk7Cj4gPiA+ID4KPiA+ID4gPiBXaGF0IGRvIHlvdSBuZWVkIHRoaXMgYWxpZ25lZF9p
ZHggZm9yID8KPiA+ID4gPiBJJ2QgZXhwZWN0IHRoYXQgYWJvdmUgImFjY2Vzc2VkX2FyZ3MgfD0g
KDEgPDwgYXJnKTsiIGlzIGVub3VnaC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBXaGljaCBhbGlnbmVk
X2lkeD8gTm8gYWxpZ25lZF9pZHggaW4gdGhlIGJ0Zl9jdHhfYWNjZXNzKCksIGFuZAo+ID4gPiBh
bGlnbmVkX2lkeCBpcyBvbmx5IHVzZWQgaW4gdGhlIGJ0Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2go
KS4KPiA+ID4KPiA+ID4gSW4gdGhlIGJ0Zl9jaGVja19mdW5jX3BhcnRfbWF0Y2goKSwgSSBuZWVk
IHRvIGNvbXBhcmUgdGhlCj4gPiA+IHQxLT5hcmdzW2ldIGFuZCB0Mi0+YXJnc1tqXSwgd2hpY2gg
aGF2ZSB0aGUgc2FtZSBvZmZzZXQuIEFuZAo+ID4gPiB0aGUgYWxpZ25lZF9pZHggaXMgdG8gZmlu
ZCB0aGUgImoiIGFjY29yZGluZyB0byB0aGUgb2Zmc2V0IG9mCj4gPiA+IHQxLT5hcmdzW2ldLgo+
ID4KPiA+IEFuZCB0aGF0J3MgbXkgcXVlc3Rpb24uCj4gPiBXaHkgeW91IGRvbid0IGRvIHRoZSBt
YXggb2YgYWNjZXNzZWRfYXJncyBhY3Jvc3MgYWxsIGF0dGFjaAo+ID4gcG9pbnRzIGFuZCBkbyBi
dGZfY2hlY2tfZnVuY190eXBlX21hdGNoKCkgdG8gdGhhdCBhcmdubwo+ID4gaW5zdGVhZCBvZiBu
YXJnczEuCj4gPiBUaGlzICdvZmZzZXQgKz0gYnRmX3R5cGVfaXNfcHRyKHQxKSA/IDggOiByb3Vu
ZHVwLi4uCj4gPiBpcyBvZGQuCj4KPiBIaSwgSSdtIHRyeWluZyB0byBtYWtlIHRoZSBicGYgZmxl
eGlibGUgZW5vdWdoLiBMZXQncyB0YWtlIGFuIGV4YW1wbGUsCj4gbm93IHdlIGhhdmUgdGhlIGJw
ZiBwcm9ncmFtOgo+Cj4gaW50IHRlc3QxX3Jlc3VsdCA9IDA7Cj4gaW50IEJQRl9QUk9HKHRlc3Qx
LCBpbnQgYSwgbG9uZyBiLCBjaGFyIGMpCj4gewo+ICAgICB0ZXN0MV9yZXN1bHQgPSBhICsgYzsK
PiAgICAgcmV0dXJuIDA7Cj4gfQo+Cj4gSW4gdGhpcyBwcm9ncmFtLCBvbmx5IHRoZSAxc3QgYW5k
IDNyZCBhcmcgaXMgYWNjZXNzZWQuIFNvIGFsbCBrZXJuZWwKPiBmdW5jdGlvbnMgd2hvc2UgMXN0
IGFyZyBpcyBpbnQgYW5kIDNyZCBhcmcgaXMgY2hhciBjYW4gYmUgYXR0YWNoZWQKPiBieSB0aGlz
IGJwZiBwcm9ncmFtLCBldmVuIGlmIHRoZWlyIDJuZCBhcmcgaXMgZGlmZmVyZW50Lgo+Cj4gQW5k
IGxldCdzIHRha2UgYW5vdGhlciBleGFtcGxlIGZvciBzdHJ1Y3QuIFRoaXMgaXMgb3VyIGJwZiBw
cm9ncmFtOgo+Cj4gaW50IHRlc3QxX3Jlc3VsdCA9IDA7Cj4gaW50IEJQRl9QUk9HKHRlc3QxLCBs
b25nIGEsIGxvbmcgYiwgY2hhciBjKQo+IHsKPiAgICAgdGVzdDFfcmVzdWx0ID0gYzsKPiAgICAg
cmV0dXJuIDA7Cj4gfQo+Cj4gT25seSB0aGUgM3JkIGFyZyBpcyBhY2Nlc3NlZC4gQW5kIHdlIGhh
dmUgZm9sbG93aW5nIGtlcm5lbCBmdW5jdGlvbjoKPgo+IGludCBrZXJuZWxfZnVuY3Rpb24xKGxv
bmcgYSwgbG9uZyBiLCBjaGFyIGMpCj4gewo+IHh4eAo+IH0KPgo+IHN0cnVjdCB0ZXN0MSB7Cj4g
ICAgIGxvbmcgYTsKPiAgICAgbG9uZyBiOwo+IH07Cj4gaW50IGtlcm5lbF9mdW5jdGlvbjIoc3Ry
dWN0IHRlc3QxIGEsIGNoYXIgYikKPiB7Cj4geHh4Cj4gfQo+Cj4gVGhlIGtlcm5lbF9mdW5jdGlv
bjEgYW5kIGtlcm5lbF9mdW5jdGlvbjIgc2hvdWxkIGJlIGNvbXBhdGlibGUsCj4gYXMgdGhlIGJw
ZiBwcm9ncmFtIG9ubHkgYWNjZXNzZWQgdGhlIGN0eFsyXSwgd2hvc2Ugb2Zmc2V0IGlzIDE2Lgo+
IEFuZCB0aGUgYXJnIGluIGtlcm5lbF9mdW5jdGlvbjEoKSB3aXRoIG9mZnNldCAxNiBpcyAiY2hh
ciBjIiwgdGhlCj4gYXJnIGluIGtlcm5lbF9mdW5jdGlvbjIoKSB3aXRoIG9mZnNldCAxNiBpcyAi
Y2hhciBiIiwgd2hpY2ggaXMKPiBjb21wYXRpYmxlLgoKSSBzZWUuCkkgdGhvdWdodCB5b3UncmUg
c2hhcmluZyB0aGUgdHJhbXBvbGluZSBhY3Jvc3MgYXR0YWNobWVudHMuCihzaW5jZSBicGYgcHJv
ZyBpcyB0aGUgc2FtZSkuCkJ1dCBhYm92ZSBhcHByb2FjaCBjYW5ub3QgcG9zc2libHkgd29yayB3
aXRoIGEgc2hhcmVkIHRyYW1wb2xpbmUuCllvdSBuZWVkIHRvIGNyZWF0ZSBpbmRpdmlkdWFsIHRy
YW1wb2xpbmUgZm9yIGFsbCBhdHRhY2htZW50CmFuZCBwb2ludCB0aGVtIHRvIHNpbmdsZSBicGYg
cHJvZy4KCnRiaCBJJ20gbGVzcyBleGNpdGVkIGFib3V0IHRoaXMgZmVhdHVyZSBub3csIHNpbmNl
IHNoYXJpbmcKdGhlIHByb2cgYWNyb3NzIGRpZmZlcmVudCBhdHRhY2htZW50cyBpcyBuaWNlLCBi
dXQgaXQgd29uJ3Qgc2NhbGUKdG8gdGhvdXNhbmRzIG9mIGF0dGFjaG1lbnRzLgpJIGFzc3VtZWQg
dGhhdCB0aGVyZSB3aWxsIGJlIGEgc2luZ2xlIHRyYW1wb2xpbmUgd2l0aCBtYXgoYXJnbm8pCmFj
cm9zcyBhdHRhY2htZW50cyBhbmQgYXR0YWNoL2RldGFjaCB3aWxsIHNjYWxlIHRvIHRob3VzYW5k
cy4KCldpdGggaW5kaXZpZHVhbCB0cmFtcG9saW5lIHRoaXMgd2lsbCB3b3JrIGZvciB1cCB0byBh
IGh1bmRyZWQKYXR0YWNobWVudHMgbWF4LgoKTGV0J3Mgc3RlcCBiYWNrLgpXaGF0IGlzIHRoZSBl
eGFjdCB1c2UgY2FzZSB5b3UncmUgdHJ5aW5nIHRvIHNvbHZlPwpOb3QgYW4gYXJ0aWZpY2lhbCBv
bmUgYXMgc2VsZnRlc3QgaW4gcGF0Y2ggOSwgYnV0IHRoZSByZWFsIHVzZSBjYXNlPwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
